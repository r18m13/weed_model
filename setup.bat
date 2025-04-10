@echo off
rem ------------------------
rem Project: Project_W
rem Description: Training of a weed model to identify strawberries and weeds.
rem ------------------------
rem ------------------------
rem Skills: Python, Git, Machine Learning, Image Processing.
rem Requirements: Dataset, A good GPU, VS Code, GIT.
rem ------------------------

echo Project_W
echo Init

rem ------------------------
rem Step 1: Initialize the Dataset
rem ------------------------

echo Extract frames from a video file using extract_frame.py to get images.
echo Upload and Annotate the images in roboflow

rem ------------------------
rem Step 2: Download the Annotated Dataset
rem ------------------------


echo Install roboflow 
python -m pip install roboflow
pause
echo Execute the data.py file to download the Dataset
python "data.py"
pause

rem ------------------------
rem Step3: Clone the YOLO repo fron git and install the contents of the requirements.txt file.
rem ------------------------

echo Clone the repo YOLOv5 ultralytics
git clone https://github.com/ultralytics/yolov5.git
echo This project uses Yolov5
echo Go to the yolov5 directory
cd yolov5
echo Install requirements
python -m pip install -U -r requirements.txt

rem -------------------------
rem Step4: Move the Dataset to yolov5 directory
rem -------------------------

echo Moving
move Weed-29 yolov5\

rem -------------------------
rem Step5: Train the model
rem -------------------------

echo Training

echo Running training with the following parameters:

echo --img 640          :: Sets input image size to 640x640 pixels
echo --batch 16         :: Uses a batch size of 16 images per training iteration
echo --epochs 50        :: Trains the model for 50 full passes through the dataset
echo --data yolov5/Weed-29/data.yaml  :: Path to dataset configuration file (classes, paths, etc.)
echo --weights yolov5s.pt  :: Loads pre-trained weights from YOLOv5 small model (yolov5s.pt)
echo --cache            :: Caches images in memory for faster data loading during training

cd yolov5
python train.py --img 640 --batch 16 --epochs 50 --data yolov5/Weed-29/data.yaml --weights yolov5s.pt --cache

