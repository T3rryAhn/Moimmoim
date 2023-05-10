const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');
const imageGrid = document.querySelector('.image-grid');

let currentIndex = 0;

nextButton.addEventListener('click', () => {
  currentIndex++;
  if (currentIndex >= imageGrid.children.length) {
    currentIndex = 0;
  }
  imageGrid.style.transform = `translateX(-${currentIndex * 100}%)`;
});

prevButton.addEventListener('click', () => {
  currentIndex--;
  if (currentIndex < 0) {
    currentIndex = imageGrid.children.length - 1;
  }
  imageGrid.style.transform = `translateX(-${currentIndex * 100}%)`;
});