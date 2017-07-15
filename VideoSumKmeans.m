global d numFramesWritten11 FileName framerate1;

n=numFramesWritten11-1;
fd=FrameDef.empty;
dataset=zeros(n,1);
for i=1:n
    %accessing first frames of each segment
    name=strcat(num2str(i),'.png');
    name=strcat('C:\VideoSumm\snaps\',name);
    im1=imread(name);
    
    %histograms
    im1=rgb2gray(im1);
    h=imhist(im1);
    
    value=0;
    for t=1:256
        value=value+t*h(t);
    end;
    dataset(i)=value;
    fd(i)=FrameDef(name,value,0);
    
end;

d.setValue(0.4);
[idx,C] = kmeans(dataset,k);
clust=zeros(n,k);
final=zeros(l,1);

for j=1:k
    for o=1:n
        if idx(o)==j
    clust(o,j)=dataset(o,1);
        end
    end
end

d.setValue(0.5);
rr=1;
ss=1;
temp=1;
clust=sort(clust,'descend');
while true
    if(ss>l)
        break;
    end
    if (clust(temp,rr)~=0)
       pos=checkValue(clust(temp,rr),n,fd); %find the value in object array
       if(fd(pos).flag==0)                  %flag to avoid repeatability of frames
        final(ss)=clust(temp,rr); 
        fd(pos).flag=1;
        rr=mod(rr,k)+1;
        ss=ss+1;
        temp=1;
       else
        temp=temp+1;
       end
    else
        temp=temp+1;
       continue; 
    end
end

finalpos=zeros(1,l);
for i=1:l
    finalpos(i)=checkValue(final(i),n,fd);
end
sortedpos=sort(finalpos);

d.setValue(0.6);
opFolder = 'C:\VideoSumm\snaps2';
    %if  not existing 
    if ~exist(opFolder, 'dir')
    %make directory & execute as indicated in opfolder variable
    mkdir(opFolder);
    end
    
ttt=1;
for i=1:l
    count=((sortedpos(i)-1)*k*framerate1)+1;
    count2=(count+k*framerate1);
    for m = count:count2
        %numFramesWritten11 = numFramesWritten11 + 1;
        currFrame = read(mov, m);    %reading individual frames
   
        opBaseFileName = sprintf('%d.png', ttt);
        opFullFileName = fullfile(opFolder, opBaseFileName);
        imwrite(currFrame, opFullFileName, 'png');   %saving as 'png' file
        ttt=ttt+1;
    end     
end
d.setValue(0.9);

%storing snaps2 folder images in imagesNames to create a video
workingDir = 'C:\VideoSumm';
imageNames = dir(fullfile(workingDir,'snaps2','*.png'));
imageNames = {imageNames.name};

%sorting the imagesNames according to numeric names of images
for i = 1:length(imageNames)
out(i) = cellfun(@(x)str2double(regexp(x,'\d*\.\d*','match')),imageNames(i));
end
out=sort(out);
for i = 1:length(imageNames)
    imageNames(i)=cellstr(strcat(num2str(out(i)),'.png'));
end

%assign name to output file
FileName=strcat(FileName,'_summarize.avi')
outputVideo = VideoWriter(fullfile(workingDir,FileName));
outputVideo.FrameRate = framerate1;
open(outputVideo)

for ii = 1:length(imageNames)
   img = imread(fullfile(workingDir,'snaps2',imageNames{ii}));
   writeVideo(outputVideo,img)
end

d.setValue(1);
close(outputVideo)
d.dispose();
msgbox('Processing Finished');

%remove directories
rmdir('C:\VideoSumm\snaps','s');
rmdir('C:\VideoSumm\snaps2','s');
analysisOfProcess;