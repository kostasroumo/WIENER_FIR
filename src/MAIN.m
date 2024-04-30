%% WIENER FILTER DENOISING 
clear;
clc;

%% ORIGINAL SOUND + WHITE GAUSSIAN NOISE I

original='guit1.wav';
[y,Fs]=audioread(original);
% sound(y,Fs);
N=length(y);
noise=(0.01) * randn(N,1);
x=y+noise;
snr_noisy=snr(y,noise);
% sound(x,Fs);
x=x.';
y=y.';

% PLOT SIGNALS
 
figure;
subplot(2,1,1);
plot(y);
title('Original Signal');
xlabel('Time');
ylabel('Amplitude');

subplot(2,1,2);
plot(x);
title('Noisy Signal');
xlabel('Time');
ylabel('Amplitude');

%%  DENOISED WIENER  II

noise=noise.';

z1=my_wiener(x,y,10); % order 10
z2=my_wiener(x,y,20); % order 20
z3=my_wiener(x,y,30); % order 30
sound(z3,Fs);
snr_1=snr(z1,z1-y);
snr_2=snr(z2,z2-y);
snr_3=snr(z3,z3-y);

%%   FRAME WIND AND FRAME RECON III


z1=wiener_frames(x,y,10);
z2=wiener_frames(x,y,20);
z3=wiener_frames(x,y,30);

new_y=[y,zeros(1,10)]; % add 10 zeros cause of frame_wind

snr_1=snr(z1,z1-new_y);
snr_2=snr(z2,z2-new_y);
snr_3=snr(z3,z3-new_y);



%% WHITE GAUSSIAN CORR IV

noise_cor=xcorr(noise);
figure;
plot(noise_cor);
title('Noisy Signal');
xlabel('Time');
ylabel('Amplitude');
grid on;


%% FIND SILENCE PERIOD + DENOISE WITH NEWIENER V

[start_idx,end_idx]=find_silence(x,100);

silence_x=x(start_idx:end_idx);
noise_x=noise(start_idx:end_idx);
% silence_x=silence_x.';
noise_x=noise_x.';


z1=neWiener(x,noise_x,10);
z2=neWiener(x,noise_x,20);
z3=neWiener(x,noise_x,30);
sound(z3,Fs);

snr_1=snr(z1,z1-y);
snr_2=snr(z2,z2-y);
snr_3=snr(z3,z3-y);
%%  FRAME REC0N+WIND WHITHOUT STARTING SIGNAL VI

z1=neWiener_frames(x,10);
z2=neWiener_frames(x,20);
z3=neWiener_frames(x,30);


new_y=[y,zeros(1,10)]; % add 10 zeros cause of frame_wind

snr_1=snr(z1,z1-new_y);
snr_2=snr(z2,z2-new_y);
snr_3=snr(z3,z3-new_y);

%%

values=15;
a=wiener_predict_frames(values,x,y,30);

% fprintf('First %d values:\n', values);
% disp(a);

