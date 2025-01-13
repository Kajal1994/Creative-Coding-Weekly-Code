let img1, img2, img3,img4; // Variables to store images
let currentImage = 0; // Track the index of the base image
function preload() {
  // Load the images
  img = loadImage("w1-t1-img1-s1.jpg");
  img2 = loadImage("w1-t1-img2-s2.jpg");
  img3 = loadImage("w1-t1-img3-s3-1.jpg");
  img4 = loadImage("w1-t1-img4-s4.jpg");
}
function setup() {
  createCanvas(400, 400);
  noLoop();
  
} 


function draw() {
  background(220);
  // Base image
  let baseImage = currentImage % 3 === 0 ? img: currentImage % 3 === 1 ? img : img4;
  
  // Blended image
  let blendImage = currentImage % 3 === 0 ? img2 : currentImage % 3 === 1 ? img3 : img2;

  // Display the base image
  image(baseImage, 0, 0, 400, 400);

  // Blend the second image on top of the base image
  blend(blendImage, 0, 0, 200, 400, 0, 0, 200, 400, DARKEST);

  // Increment the image index
  currentImage++;
  
  
  //image(img, 0, 0, 150, 150);
 // image(img2, 0, 150, 250, 0)
 // image(img3, 150, 0, 250, 170);
  //image(img4, 250, 150, 150, 0)
}
function mousePressed() {
  redraw(); // Redraw the canvas on mouse press
}
