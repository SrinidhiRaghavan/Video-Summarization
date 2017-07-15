global ExPath d l k framerate1 numFrames1 numFramesWritten11;

%Extracting & Saving of frames from a Video file through Matlab Code%
d.setValue(0.1);
l=8;
disp(ExPath);
% assigning the name of sample avi file to a variable
filename1 = ExPath;

%reading a video file
mov = VideoReader(filename1);
framerate1=mov.FrameRate;
k1=round(mov.duration/60);
k=k1*2;

% Defining Output folder as 'snaps'
opFolder = 'C:\VideoSumm\snaps';

%if  not existing 
if ~exist(opFolder, 'dir')
%make directory & execute as indicated in opfolder variable
mkdir(opFolder);
end

%getting no of frames
numFrames1= mov.NumberOfFrames;

%setting current status of number of frames written to zero
numFramesWritten11 = 0;
t=1;

%for loop to traverse & process from frame '1' to 'last' frames 
for m = 1 :k*framerate1 :numFrames1
    numFramesWritten11 = numFramesWritten11 + 1;
    currFrame = read(mov, m);    %reading individual frames
    opBaseFileName = sprintf('%d.png', t);
    opFullFileName = fullfile(opFolder, opBaseFileName);
    imwrite(currFrame, opFullFileName, 'png');   %saving as 'png' file
    t=t+1;
end     

d.setValue(0.3);
VideoSumKmeans;
