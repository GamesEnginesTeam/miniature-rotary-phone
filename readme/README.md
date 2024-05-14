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

Include all team members names and student numbers if a team project

# Description
This project is a simple flocking simulation game, which the bird will separate when they get too close, try to get close to each other when they meet other bird, and they also will face the same direction to move.

## Video:

[![YouTube](http://img.youtube.com/vi/J2kHSSFA4NU/0.jpg)](https://www.youtube.com/watch?v=J2kHSSFA4NU)

## Google Drive:
https://drive.google.com/drive/folders/1oUlCEtrgKMn2k3R5RPPJNN846DZGdXq-?usp=sharing

## Screenshots

# Instructions

# How it works
To sucess the flocking simulation, we need three function, alignment, cohesion, separation.

Alignment: This funciton is used to make the birds face the same direction

- First, we get all the bird units velocity
- Second, we get the average of the velocity and multiply with the MAX speed. To prevent it going faster and faster, it also subtracts their orignal velocity to reset their speed.

Cohension: This function will make the birds go slower to get closer together
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

# From here on, are examples of how to different things in Markdown. You can delete.  

## This is how to markdown text:

This is *emphasis*

This is a bulleted list

- Item
- Item

This is a numbered list

1. Item
1. Item

This is a [hyperlink](http://bryanduggan.org)

# Headings
## Headings
#### Headings
##### Headings

This is code:

```Java
public void render()
{
	ui.noFill();
	ui.stroke(255);
	ui.rect(x, y, width, height);
	ui.textAlign(PApplet.CENTER, PApplet.CENTER);
	ui.text(text, x + width * 0.5f, y + height * 0.5f);
}
```

So is this without specifying the language:

```
public void render()
{
	ui.noFill();
	ui.stroke(255);
	ui.rect(x, y, width, height);
	ui.textAlign(PApplet.CENTER, PApplet.CENTER);
	ui.text(text, x + width * 0.5f, y + height * 0.5f);
}
```

This is an image using a relative URL:

![An image](images/p8.png)

This is an image using an absolute URL:

![A different image](https://bryanduggandotorg.files.wordpress.com/2019/02/infinite-forms-00045.png?w=595&h=&zoom=2)

This is a youtube video:

[![YouTube](http://img.youtube.com/vi/J2kHSSFA4NU/0.jpg)](https://www.youtube.com/watch?v=J2kHSSFA4NU)

This is a table:

| Heading 1 | Heading 2 |
|-----------|-----------|
|Some stuff | Some more stuff in this column |
|Some stuff | Some more stuff in this column |
|Some stuff | Some more stuff in this column |
|Some stuff | Some more stuff in this column |

