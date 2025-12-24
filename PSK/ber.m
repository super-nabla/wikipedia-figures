% Definiamo il range di Eb/No in dB
EbNo = 0:12; 

% Prepariamo la figura
figure;

% 1. BPSK (M=2) - Nota: il BER di BPSK e QPSK coincide rispetto a Eb/No
ber2 = berawgn(EbNo, 'psk', 2, 'nondiff');
semilogy(EbNo, ber2, '-o', 'LineWidth', 2);
hold on; % Mantiene il grafico precedente per sovrapporre gli altri

% 2. QPSK (M=4)
ber4 = berawgn(EbNo, 'psk', 4, 'nondiff');
semilogy(EbNo, ber4, '--s', 'LineWidth', 2); 

% 3. 8-PSK (M=8)
ber8 = berawgn(EbNo, 'psk', 8, 'nondiff');
semilogy(EbNo, ber8, '-.^', 'LineWidth', 2);

% 4. 16-PSK (M=16)
ber16 = berawgn(EbNo, 'psk', 16, 'nondiff');
semilogy(EbNo, ber16, ':v', 'LineWidth', 2);

% Personalizzazione del grafico
grid on;
xlabel('E_b/N_0 (dB)');
ylabel('Bit Error Rate (BER)');
title('Confronto BER per diverse modulazioni M-PSK in AWGN');

% Aggiunta della legenda
legend('BPSK (M=2)', 'QPSK (M=4)', '8-PSK (M=8)', '16-PSK (M=16)', 'Location', 'southwest');

% Impostiamo i limiti per vedere bene il decadimento
axis([0 12 10^-6 1]);