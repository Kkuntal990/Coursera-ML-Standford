inputDir = '/home/kuntal/ML-course/week2/machine-learning-ex6/new_sample/samples';

S = dir(fullfile(inputDir,'*'));
X = zeros(numel(S),1899);
y = ones(numel(S),1);
for k=1:numel(S)
    fnm = fullfile(inputDir,S(k).name);
    txt = load(fnm);
    %word_indices = processEmail(txt);
    %X(k,:) = emailFeatures(word_indices);
    fnm
    
    
end