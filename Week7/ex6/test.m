clear ; close all; clc

file_contents = readFile('emailSample1.txt');
word_indices = processEmail(file_contents);
features = emailFeatures(word_indices);
