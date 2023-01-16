# ReConnect
## Table of Contents
[Introduction](https://github.com/Reid-T-W/ReConnect#introduction)  
[Installation](https://github.com/Reid-T-W/ReConnect#installation)  
[Demo Video](https://github.com/Reid-T-W/ReConnect#demo-video)  
[Manifesto](https://github.com/Reid-T-W/ReConnect#manifesto)  
[Implemented Features](https://github.com/Reid-T-W/ReConnect#implemented-features)  
[To Do](https://github.com/Reid-T-W/ReConnect#to-do)  
[Face Search Implementation](https://github.com/Reid-T-W/ReConnect#face-search-implementation)  
[Usage](https://github.com/Reid-T-W/ReConnect#usage)  
[Contributing](https://github.com/Reid-T-W/ReConnect#contributing)  
[Related Projects](https://github.com/Reid-T-W/ReConnect#related-projects)  
[Licensing](https://github.com/Reid-T-W/ReConnect#licensing)  

## Introduction
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
![alt text](https://github.com/Reid-T-W/ReConnect/blob/master/ReConnect_home_page_for_README.png?raw=true)
ReConnect is a web app that helps in connect missing people with their loved ones. An individual can report a person as missing to the ReConnect System, and other people can search if an individual has been reported as missing, the search and retrieval will be done via face recognition. 

Developed by: [Rediet Tadesse](https://www.linkedin.com/in/rediet-tadesse-43209013b/)
## Demo Video
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)
[![Demo video for ReConnect](https://github.com/Reid-T-W/ReConnect/blob/master/Demo_Video_For_README.png?raw=true)](https://youtu.be/f7LR0ib_mG0)
All user profiles shown in this demo are fictional, some of the images were sourced from the FGNET dataset for demonstration purpose only. 
Source of FGNET dataset: Y. Fu, “FG-NET dataset by Yanwei Fu,” Github, 22-Aug-2014. [Online]. Available: http://yanweifu.github.io/FG_NET_data/. [Accessed: 18-Jul-2022].
## Manifesto  
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
Its often we see missing persons post on social media, but its also known that we look at many posts and consume various content on social media. This makes it very difficult to remember: what the person looks like, his/her contact address, or who posted about him/her.  
What if we actually came across a missing person on the streets? The chances of remembering if we have seen a post about this person is very low, and there is no convenient way to search if the person has been posted as missing.
This is what ReConnect aims to solve, its a central platform, where missing people can be reported as missing and can later be searched via face recognition.
## Implemented Features  
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)
- [x] Post Missing Person
- [x] Search Missing Person
## To Do  
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)
- [ ] Add User Account
- [ ] Implement Text Search
- [ ] Improve posting speed
- [ ] Improve searching speed
## Face Search Implementation  
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
In order to implement the face search, a library called [keras-facenet](https://github.com/faustomorales/keras-facenet) is used. It provides pre-trained versions of the facenet model.  
The facenet model is then used to generate embeddings for every face, which is later used to determing the similarity between two faces.
## Installation
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
The webapp is currently not deployed due computational resource issues, but it will be deployed soon. Users will then be able to directly access the site with the url that will be provided here

## Usage
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
### Report Missing Person
1. Click on the Post button on the home page or nav bar.
2. Upload 1 to 4 images of the missing person, fill in all the input fields.
3. Submit the form.

### Search Person
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
1. Upload the picture of the person you want to search and click on search.
2. The search results are sorted based on similarity to the person being serached.
3. Click on the closest match (first result) in order to see the details of the person and retrieve contact info.

## Contributing
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
This project is open for contributions, feel free to send pull requests, it will really help if you are very clear and specific on what features you added or improved.

## Related Projects
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
Currently their are no related projects

## Licensing
[Back to Top](https://github.com/Reid-T-W/ReConnect#table-of-contents)  
Licensed under the Apache License 2.0
