let button;
let currentTime = "";

function setup() {
  createCanvas(400, 400);
  background(240);

  button = createButton("Get Current Time");
  button.position(120, 100);
  button.mousePressed(fetchTimeFromAPI);

  textSize(16);
  fill(0);
  textAlign(CENTER);
  text("Click the button to get the current time!", width / 2, 50);
}

function draw() {
  background(240); // Clear background to avoid overlapping text
  textSize(16);
  fill(0);
  text("Click the button to get the current time!", width / 2, 50);
  if (currentTime !== "") {
    text("Current Time: " + currentTime, width / 2, 150);
  }
}

function fetchTimeFromAPI() {
  const apiURL = "https://worldtimeapi.org/api/timezone/Etc/UTC"; // API URL
  fetch(apiURL)
    .then((response) => {
      if (!response.ok) {
        throw new Error("Network response was not ok " + response.statusText);
      }
      return response.json(); // Parse the response as JSON
    })
    .then((data) => {
      currentTime = data.datetime.slice(11, 19); // Extract time
    })
    .catch((error) => {
      console.error("There was a problem with the fetch operation:", error);
      currentTime = "Error fetching data!";
    });
}
