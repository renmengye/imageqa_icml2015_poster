clear('all');
close('all');

% Plot category pie charts.
catlg = {'Object', 'Number', 'Color', 'Location'};
catdata = [54992, 27206;
           5885, 2755;
           13059, 6509;
           4800, 2478;];
figure(1);
pie(catdata(:, 1));
title('COCO-QA Train Set Distribution');
legend(catlg, 'Location', 'NorthEastOutside');
print('figures/cocoqa_dist', '-depsc', '-tiff');

% Plot performance per category.
models = {'GUESS', 'BOW', 'LSTM', 'IMG', 'IMG+PRIOR', 'K-NN', 'IMG+BOW', ...
          'VIS+LSTM', '2-VIS+BLSTM', 'FULL'};
modeldata = [0.0211, 0.3584, 0.1387, 0.0893;
             0.3727, 0.4356, 0.3475, 0.4084;
             0.3587, 0.4534, 0.3626, 0.3842;
             0.4073, 0.2926, 0.4268, 0.4419;
             0.0000, 0.3739, 0.4899, 0.4451;
             0.4799, 0.3699, 0.3723, 0.4080;
             0.5866, 0.4410, 0.5196, 0.4939;
             0.5653, 0.4610, 0.4587, 0.4552;
             0.5817, 0.4479, 0.4953, 0.4734;
             0.6108, 0.4766, 0.5148, 0.5028;];
figure(2);
set(gcf, 'position', [0, 0, 1400, 400]);
set(gcf, 'PaperPosition', [0, 0, 14, 4]);
set(gcf, 'PaperSize', [10, 4]);
bar(modeldata);
legend(catlg);
title('COCO-QA Accuracy Per Category');
ylabel('Accuracy')
set(gca, 'XTick', 1:size(modeldata, 1), 'XTickLabel', models);
print('figures/model_cat', '-depsc', '-tiff');
