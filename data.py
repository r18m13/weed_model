from roboflow import Roboflow
rf = Roboflow(api_key="2NgvgjF6XrspYkpfpICO")
project = rf.workspace("husky-model").project("weed-x7gb5")
version = project.version(29)
dataset = version.download("yolov5")
