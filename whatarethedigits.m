%% A signal, or function, can be composed of two (or more) functions
%  
%  For example, 
%  h(x) = a f(x) + b g(x)
%
%  That is, h(x) is a linear combination of "vectors", in this case
%  the vectors are from a function space.
%  
%  We can exploit this fact and decompose the linear combination, thus
%  finding the frequencies that comprise the tone.
%
%  FOURIER SERIERS uses a set of orthogonal basis functions
%  FOURIER Tranform converts time-domain --> Frequency-domain
%  FOURIER SERIES - without them, we'd be NOTHING!
%

load phonenumber  % uncomment if needed


% clear variables
clear n
clear d 
clear p 
clear f
clear D


% uncomment/comment to play/disable entire intercepted digits
 % sound(double(y.sig)/128);  


% Initialize Variables
    n=11;                           % 11 digits
    d=zeros(n,6800);                % initialize signal
    p=zeros(n,6800);                % initialize power
    f=(0:6799)*(y.fs/6800);         % set Frequencies
    D=[];

    
% split into single digits for analysis
    for k=1:n
        d(k,:)=double(y.sig(6800*(k-1)+1:6800*k))/128;  % digits
        p=abs(fft(d(k,:)));         % Fourier Transform
        sound(d(k,:));              % play sound
        
        plot(f,p);                  % plot power vs. Freq.
        axis([600 1500 0 600]);     % sets axis properly
        [F,z] = ginput(2);           % find DTMF tones graphically
         
        
        % Determined which two frequencies (Duel Tones) DTMF
        if     (F(1,1) >= 650 && F(1,1) <= 720)  && (F(2,1) >= 1180 && F(2,1) <= 1250) 
            D=[D,'1'];
        elseif (F(1,1) >= 650 && F(1,1) <= 720)  && (F(2,1) >= 1300 && F(2,1) <= 1360)
            D=[D,'2'];
        elseif (F(1,1) >= 650 && F(1,1) <= 720)  && (F(2,1) >= 1400 && F(2,1) <= 1500)
            D=[D,'3'];
        elseif (F(1,1) >= 750 && F(1,1) <= 810)  && (F(2,1) >= 1180 && F(2,1) <= 1250)
            D=[D,'4'];
        elseif (F(1,1) >= 750 && F(1,1) <= 810)  && (F(2,1) >= 1300 && F(2,1) <= 1360)
            D=[D,'5'];
        elseif (F(1,1) >= 750 && F(1,1) <= 810)  && (F(2,1) >= 1400 && F(2,1) <= 1500)
            D=[D,'6'];
        elseif (F(1,1) >= 820 && F(1,1) <= 900)  && (F(2,1) >= 1180 && F(2,1) <= 1250)
            D=[D,'7'];
        elseif (F(1,1) >= 820 && F(1,1) <= 900)  && (F(2,1) >= 1300 && F(2,1) <= 1360)
            D=[D,'8'];
        elseif (F(1,1) >= 820 && F(1,1) <= 900)  && (F(2,1) >= 1400 && F(2,1) <= 1500)
            D=[D,'9'];
        elseif (F(1,1) >= 900 && F(1,1) <= 1000) && (F(2,1) >= 1180 && F(2,1) <= 1250)
            D=[D,'*'];
        elseif (F(1,1) >= 900 && F(1,1) <= 1000) && (F(2,1) >= 1300 && F(2,1) <= 1360)
            D=[D,'0'];
        elseif (F(1,1) >= 900 && F(1,1) <= 1000) && (F(2,1) >= 1400 && F(2,1) <= 1500)
            D=[D,'#'];
        else 
            D=[D,' ERROR ']; 
        end % end if
        
        
        % Pretty Phone Formating, add dashes
        if length(D)==1 ||length(D)==5 || length(D)==9
            D=[D,'-'];
        end % end if
        
    end % end loop
    
    % AND THE PHONE NUMBER IS.....
    disp(D);