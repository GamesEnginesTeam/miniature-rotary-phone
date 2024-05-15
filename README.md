# Project Title

Name:
- Daniel Mendes
- Ho Chung
- Keith Railey Rumbaua

Student Number:
- C20489272
- C20348256
- C20463336

Class Group: TU858

# Description
This project is a simple flocking simulation game, which the bird will separate when they get too close, try to get close to each other when they meet other bird, and they also will face the same direction to move.

## Video:

[![YouTube](http://img.youtube.com/vi/J2kHSSFA4NU/0.jpg)](https://www.youtube.com/watch?v=J2kHSSFA4NU)

## Google Drive:
https://drive.google.com/drive/folders/1oUlCEtrgKMn2k3R5RPPJNN846DZGdXq-?usp=sharing

## Screenshots

# Instructions

# How it works
To perform the flocking simulation, we need three functions, alignment, cohesion, separation.

Alignment: This function is used to make the birds face the same direction

- First, we get all the bird units velocity
- Second, we get the average of the velocity and multiply with the MAX speed. To prevent it going faster and faster, it also subtracts their orignal velocity to reset their speed.

Cohesion: This function will make the birds go slower to get closer together
- First, we get all the positions of the birds
- Second, we find the center position of the birds and normlize this result to get the direction

Separation: This function is used to make a bird try to move away from other birds
- We get the distance between the bird itself and other birds
- Finally, we get the average of the separation and normalized this result to get the velocity

At the end, we add these 3 results with the weight to get the final velocity

# List of classes/assets

| Class/asset | Source |
|-----------|-----------|
| MyClass.cs | Self written |
| MyClass1.cs | Modified from [reference]() |
| MyClass2.cs | From [reference]() |

Each team member or individual needs to write a paragraph or two explaining what they contributed to the project

- What they did
- What they are most proud of
- What they learned

# References
* Item 1
* Item 2
