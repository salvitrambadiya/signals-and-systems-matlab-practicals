function ss_project_salvi_C6_52
% A52 - Sampling Theorem and Aliasing Demonstrator
% x(t) = cos(2*pi*fm*t) + cos(2*pi*f2*t)   (f2 = 0 turns off the second tone)

fig = figure('Name','Sampling & Aliasing','NumberTitle','off', ...
             'Position',[80 60 1050 720]);

% Input boxes and buttons
mk = @(lbl,val,x) [ ...
    uicontrol(fig,'Style','text','String',lbl,'Units','normalized', ...
              'Position',[x 0.95 0.09 0.03]); ...
    uicontrol(fig,'Style','edit','String',val,'Units','normalized', ...
              'Position',[x 0.92 0.09 0.04])];
h = mk('fm (Hz)','100',0.02);   eFm = h(2);
h = mk('f2 (Hz, 0=off)','0',0.12); eF2 = h(2);
h = mk('fs (Hz)','150',0.22);   eFs = h(2);
h = mk('LPF order','8',0.32);   eOrd = h(2);
chk = uicontrol(fig,'Style','checkbox','String','Anti-alias LPF (fc = fs/2)', ...
    'Units','normalized','Position',[0.43 0.92 0.2 0.04],'Value',0);
uicontrol(fig,'Style','pushbutton','String','Run','Units','normalized', ...
    'Position',[0.65 0.92 0.08 0.05],'Callback',@onRun);
uicontrol(fig,'Style','pushbutton','String','Tradeoff plots','Units','normalized', ...
    'Position',[0.75 0.92 0.12 0.05],'Callback',@onTradeoff);
info = uicontrol(fig,'Style','text','Units','normalized','FontSize',10, ...
    'Position',[0.02 0.87 0.96 0.04],'HorizontalAlignment','left');

ax1 = subplot(3,1,1,'Parent',fig);
ax2 = subplot(3,1,2,'Parent',fig);
ax3 = subplot(3,1,3,'Parent',fig);
set(ax1,'Position',[0.07 0.66 0.9 0.18]);
set(ax2,'Position',[0.07 0.38 0.9 0.18]);
set(ax3,'Position',[0.07 0.08 0.9 0.18]);

    function [fm,f2,fs,ord,ok] = readInputs()
        fm = str2double(eFm.String); f2 = str2double(eF2.String);
        fs = str2double(eFs.String); ord = str2double(eOrd.String);
        ok = all(isfinite([fm f2 fs ord])) && fm>0 && fs>0 && f2>=0 && ord>=1;
        if ~ok, errordlg('Need fm>0, fs>0, f2>=0, order>=1 (numbers only).'); end
    end

    function onRun(~,~)
        [fm,f2,fs,ord,ok] = readInputs(); if ~ok, return; end
        useLPF = chk.Value;
        [t,x,xf,ts,xs,xr] = simulate(fm,f2,fs,ord,useLPF);

        % Original, sampled and reconstructed signals
        plot(ax1,t,x,'b'); title(ax1,'Original (dense grid = "continuous")');
        if useLPF, hold(ax1,'on'); plot(ax1,t,xf,'g--'); hold(ax1,'off');
            legend(ax1,'original','after LPF'); end
        stem(ax2,ts,xs,'r','filled'); title(ax2,sprintf('Sampled at fs = %g Hz',fs));
        plot(ax3,t,x,'b:'); hold(ax3,'on'); plot(ax3,t,xr,'m','LineWidth',1.3);
        stem(ax3,ts,xs,'r'); hold(ax3,'off');
        title(ax3,'Reconstructed (sinc interpolation) vs original');
        legend(ax3,'original','reconstructed','samples');
        xlabel(ax3,'time (s)');

        % Aliasing check for each tone
        tones = [fm f2(f2>0)];
        msg = '';
        for f = tones
            fa = abs(f - fs*round(f/fs));
            if fs < 2*f
                msg = [msg sprintf('ALIASING: %g Hz appears as %g Hz.  ',f,fa)]; %#ok<AGROW>
            else
                msg = [msg sprintf('%g Hz OK (fs >= 2f).  ',f)]; %#ok<AGROW>
            end
        end
        info.String = msg;
        info.ForegroundColor = [0.7*(fs<2*max(tones)) 0 0];
    end

    function onTradeoff(~,~)
        [fm,f2,fs,ord,ok] = readInputs(); if ~ok, return; end

        % Error vs sampling frequency
        fsv = linspace(0.5,6,30)*max([fm f2]);
        e0 = zeros(size(fsv)); e1 = e0;
        for k = 1:numel(fsv)
            [~,x,~,~,~,xr0] = simulate(fm,f2,fsv(k),ord,false);
            [~,~,~,~,~,xr1] = simulate(fm,f2,fsv(k),ord,true);
            e0(k) = mseMid(x,xr0); e1(k) = mseMid(x,xr1);
        end

        % Error and energy lost vs filter cutoff
        fcv = linspace(0.2,1.5,25)*fs/2; ee = zeros(size(fcv)); el = ee;
        for k = 1:numel(fcv)
            [~,x,xf,~,~,xr] = simulate(fm,f2,fs,ord,true,fcv(k));
            ee(k) = mseMid(x,xr);
            el(k) = 1 - sum(xf.^2)/sum(x.^2);
        end

        figure('Name','Tradeoff','NumberTitle','off','Position',[160 100 900 450]);
        subplot(1,2,1); semilogy(fsv,e0,'r-o',fsv,e1,'b-s'); grid on;
        xlabel('fs (Hz)'); ylabel('MSE vs original'); legend('no LPF','with LPF (fs/2)');
        title('Higher fs -> better reconstruction');
        subplot(1,2,2); yyaxis left; plot(fcv,ee,'-o'); ylabel('MSE vs original');
        yyaxis right; plot(fcv,el,'-s'); ylabel('energy lost by LPF');
        xline(fs/2,'k--','fs/2'); grid on; xlabel('LPF cutoff (Hz)');
        title(sprintf('Cutoff sweep at fs = %g Hz',fs));
    end
end

% Core simulation
function [t,x,xf,ts,xs,xr] = simulate(fm,f2,fs,ord,useLPF,fc)
    if nargin < 6, fc = fs/2; end
    fmax = max([fm f2 fs]);
    T  = min(6/fm, 200/fs);
    N  = max(20000, ceil(T*20*fmax));
    t  = linspace(0,T,N); Fd = (N-1)/T;
    x  = cos(2*pi*fm*t) + (f2>0)*cos(2*pi*f2*t);

    % Butterworth low-pass filter (applied through FFT)
    xf = x;
    if useLPF
        f  = (0:N-1)*Fd/N; f = min(f, Fd-f);
        H  = 1./sqrt(1 + (f/fc).^(2*ord));
        xf = real(ifft(fft(x).*H));
    end

    % Sampling
    ts = (0:floor(T*fs))/fs;
    xs = interp1(t,xf,ts,'linear');

    % Sinc reconstruction
    xr = zeros(size(t));
    for n = 1:numel(ts)
        xr = xr + xs(n)*mysinc((t-ts(n))*fs);
    end
end

function s = mysinc(u)
    s = ones(size(u)); k = (u ~= 0);
    s(k) = sin(pi*u(k))./(pi*u(k));
end

% Mean squared error over the middle 60% of the window (edges ignored)
function e = mseMid(x,xr)
    n = numel(x); i = round(0.2*n):round(0.8*n);
    e = mean((x(i)-xr(i)).^2);
end