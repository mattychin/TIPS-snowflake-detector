%% Algorithm to train a cascade object detector to detect TIPS snowflakes

% % Load Positive Images with Bounding Boxes from the "Training Image Labeler App"
% data = snowflakes2;
% % 
% % % Load Negative Images
% negativeFolder = fullfile('/Users/matthew/Documents/MATLAB/Project/Negatives');
% % 
% % % Train Detector 
% % % Increasing the number of stages may result in a more accurate detector 
% % % but also increases training time. More stages may require more training 
% % % images., because at each stage, some number of positive and negative 
% % % samples may be eliminated.
% trainCascadeObjectDetector('Detector1.xml',data,negativeFolder,'FalseAlarmRate',0.2,'NumCascadeStages',10);

% %% TIPS Snowflake Detection
% 
% Load trained snowflake detector
detector = vision.CascadeObjectDetector('Detector.xml');
% Load test image

img = imread('a2.1_50e.tif');
% Add bounding box + label to detected snowflakes
bbox = step(detector,img);  
detectedImg = insertObjectAnnotation(img,'rectangle',bbox,'snowflake');
figure;
imshow(detectedImg);

Snowflakes_detected = length(bbox) % return the number of snowflakes detected

% Obtain the area of each detected snowflake and store them in "Area"
for i = 1:Snowflakes_detected
    Area(i) = (bbox(i,3))*(bbox(i,4)); % width x height
end