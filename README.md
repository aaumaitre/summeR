# summeR
Summer inspired palettes for R

It is day 50 of lockdown as I am writing this, and if there is **one thing** that I keep thinking about how much I miss, that is lying down at the beach, just enjoying a book and the warmth of the sun 🌞. Given that going to the beach is not actually a possibility -it's actually kind of cold-ish outside at the moment-, and after endless staring at old Summer pictures, I found out about [this color gradient tool](https://color.adobe.com/es/create/image-gradient) a few days ago (gracias Jorge!) and started playing around with my Summer pictures on it. In the end, I really liked some of the resulting palettes and I think I'll be using them, so I ended up writing a short package to upload my favorite ones.

Most of the package code is based on my favorite color scales package: [wesanderson](https://github.com/karthik/wesanderson) by Karthik Ram.

## Installation

```r
devtools::install_github("aaumaitre/summeR")
```

## Usage

```r 
library("summeR")

# See all palettes
names(summeR_colors)
#>[1] "sunbathing" "lunch" "PastelSunset" "BlueShades"  "camping"     
```

## Palettes

```r
summeR("sunbathing")
```
<img src="https://github.com/aaumaitre/summeR/blob/master/sunbathing.png?raw=true " width="500">

```r
summeR("PastelSunset")
```

<img src="https://github.com/aaumaitre/summeR/blob/master/PastelSunset.png?raw=true " width="500">

```r
summeR("BlueShades")
```

<img src="https://github.com/aaumaitre/summeR/blob/master/BlueShades.png?raw=true " width="500">

```r
summeR("camping")
```

<img src="https://github.com/aaumaitre/summeR/blob/master/camping.png?raw=true " width="500">

```r
summeR("lunch")
```

<img src="https://github.com/aaumaitre/summeR/blob/master/lunch.png?raw=true " width="500">

## Examples 

```r
ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width))+
  geom_point(aes(color=Species, shape=Species)) +
  scale_color_manual(values = summeR("sunbathing"))+
  xlab("Sepal Length") +  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")+
  theme_minimal()
  ```
  <img src="https://github.com/aaumaitre/summeR/blob/master/ex1.png?raw=true " width="500">
  
  ```r
  ggplot(data=iris, aes(x=Species, y=Sepal.Length))+
geom_boxplot(aes(fill=Species)) + 
  scale_fill_manual(values = summeR("PastelSunset"))+
  ylab("Sepal Length") + ggtitle("Iris Boxplot") +
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)
  ```
<img src="https://github.com/aaumaitre/summeR/blob/master/ex2.png?raw=true " width="500">


```r
pal <- summeR("sunbathing", n = 100, type = "continuous")
image(volcano, col = pal)
```
<img src="https://github.com/aaumaitre/summeR/blob/master/name.png?raw=true " width="500">
