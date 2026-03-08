data = readtable('OTDR_data.csv');

head(data)

snr = data.SNR;

figure
plot(snr)
xlabel('Sample Number')
ylabel('SNR')
title('Signal to Noise Ratio of Optical Network')

unique(data.Class)

summary(data.Class)

figure
scatter(data.loss , data.SNR)
xlabel('Signal Loss')
ylabel('SNR')
title('Loss vs Signal Quality')

figure
histogram(data.Class)
xlabel('Fault Type')
ylabel('Count')
title('Distribution of Fault Classes')
sum(ismissing(data))
features = data(:, {'SNR','loss','Reflectance','Position'});
labels = data.Class;
processed_data = [features table(labels)];
writetable(processed_data,'processed_data.csv')