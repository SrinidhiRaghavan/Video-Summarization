# Video-Summarization #

## Introduction ##

The rapid growth in media has led to the need to process huge chunks of visual data. But despite numerous technological advancements, there is a pit fall in this advent. Processing these very huge chunks of data demands plenty of resources like time, man-power, hardware storage, etc. So as to solve this problem, various solutions have been provided in the literature. Video Summarization plays an important part in this regard as it helps the user to navigate through and retrieve a large sequence of videos. It helps in efficient storage, quick browsing and retrieval of large collection of video data without losing important aspects.


## Problem Formulation ##

Given a video, the video summarization scans through the main video stream and generates the segments temporally. The first frame of each segment is considered to represent the entire segment. The histograms of all these representative frames are plotted. Based on these histograms, value vectors for all frames are computed. These vectors, or the dataset D, are the inputs to the clustering algorithms. The various algorithms used in this project are- K-means, KFCG (Kekre’s Fast Codebook Generation Algorithm for vector quantization) and Fuzzy C-Means. These algorithms return the clustered data set. Frames are chosen from the clusters in round robin manner and added to the summary video file.


## Algorithmic Overview ##

- The input video is taken from the user. Frames are extracted from this video.

- Temporally segment the frames

- Represent each segment using a representative frame. Depict the representative frames using value vectors

- Cluster the value vectors using a technique chosen by the user

- Chose the segment from each cluster such that it is the closest to the cluster center 

- Collate the segments to play as a continuous output video



## Code Overview and Execution Details ##

Code overview and other details can be found in the documentation file attached 





