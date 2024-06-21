function apiRequest(url, method = 'GET') {
  return fetch(`/api/${url}`, { method })
    .then(response => response.json())
}

let currentSlide = 0;
let countSlides = 0;
function main() {
  const sliderMain = document.getElementById("slide-main");
  const sliderBlocks = document.getElementById("slide-blocks");
  const sliderNavBlock = document.getElementById("block-navigate");
  const buttonNext = document.getElementById("next-slide");
  const buttonPrev = document.getElementById("prev-slide");


  sliderMain.addEventListener('mouseover', () => {
    clearInterval(autoSlideIntervalId);
  });
  sliderMain.addEventListener('mouseleave', () => {
    autoSlideEnable();
  });

  buttonNext.addEventListener('click', () => {
    showSlide({ direction: 'next' });
  });
  buttonPrev.addEventListener('click', () => {
    showSlide({ direction: 'prev' });
  });

  const sliderInfo = apiRequest('/?api=sliderInfo');
  sliderInfo.then(data => {
    countSlides = data.slides.length;
    for (let i = 0; i < data.slides.length; i++) {
      
      createSliderItemElement(Object.assign(data.slides[i], { "index": i }));

      createSliderNavigationBlockElement(i);

    }

    showSlide();
  })

  let autoSlideIntervalId;
  function autoSlideEnable() {
    clearInterval(autoSlideIntervalId);
    autoSlideIntervalId = setInterval(() => {
      showSlide({ direction: 'next' });
    }, 5000);
  }

  // function showSlide(direction = 'start') {
  function showSlide({ index, direction } = { direction: 'start' }) {
    let indexMove = 0;
    if (index) {
      indexMove = index;
    } else if (direction) {
      if (direction === 'start') {
        indexMove = 0;
      } else if (direction === 'next') {
        indexMove = (currentSlide + 1) > countSlides - 1 ? 0 : currentSlide + 1;
      } else if (direction === 'prev') {
        indexMove = currentSlide - 1 < 0 ? countSlides - 1 : currentSlide - 1;
      }
    }

    sliderBlocks.children[currentSlide].classList.remove('show');
    sliderNavBlock.children[currentSlide].classList.remove('show');

    sliderBlocks.children[indexMove].classList.add('show');
    sliderNavBlock.children[indexMove].classList.add('show');

    currentSlide = indexMove;
    autoSlideEnable();
  }

  function createSliderItemElement(data) {
    const slideElement = document.createElement('div');
      slideElement.classList.add('slider-item');
      const rightBlock = generateInfoBlock(data);
      slideElement.innerHTML = `<div class="left-block" style="background-image: url('${data.screenshots.main}');"></div>`;
      slideElement.appendChild(rightBlock)
      sliderBlocks.appendChild(slideElement);
  }

  function generateInfoBlock(data) {
    const infoBlockElement = document.createElement('div');
    infoBlockElement.classList.add('right-block');

    // блок названия приложения
    const appNameElement = document.createElement('div');
    appNameElement.classList.add('app-name');
    appNameElement.innerHTML = `<span>${data.title}</span>`;

    // блок скринштов
    const screenshots = document.createElement('div');
    screenshots.classList.add('screenshots');

    const listScreens = data.screenshots?.list || [];
    for (let i = 0; i < listScreens.length; i++) {
      const element = document.createElement('div');
      element.dataset.slide = data.index;

      element.addEventListener('mouseover', () => {
        const leftElement = sliderBlocks.children[currentSlide].querySelector(".left-block");

        leftElement.style.backgroundImage = `url(${listScreens[i]})`;
      })
      element.addEventListener('mouseleave', (e) => {
        const leftElement = sliderBlocks.children[e.target.dataset.slide].querySelector(".left-block");

        leftElement.style.backgroundImage = `url(${data.screenshots.main})`;
      });

      element.innerHTML = `<div style="background-image: url('${listScreens[i]}');"></div>`;

      screenshots.appendChild(element);
    }

    // блок
    const reason = document.createElement('div');
    reason.classList.add('reason');
    reason.innerHTML = `${data.access}`;
    reason.innerHTML = `
    <div class="main">Уже доступно</div>
    <div class="additional">
      <div>Лидер продаж</div>
    </div>`;
    
    // блок с ценой
    const discount = document.createElement('div');
    discount.classList.add('price-block');

    const price = data.price?.price;
    const disc = data.price?.discount;
    const finalPrice = price - (price * (disc / 100));

    if (disc) {
      discount.innerHTML = `
      <div class="discount">-${disc}%</div>
      <div class="price">
        <div class="orig-price">${price}</div>
        <div class="final-price">${finalPrice}</div>
      </div>
      `;
    } else if (!price || price && price === 0) {
      discount.innerHTML = `<div class="orig-price">Free</div>`;
    } else {
      discount.innerHTML = `<div class="orig-price">${price}</div>`;
    }

    // блок списка поддреживаемых платформ
    const platforms = document.createElement('div');
    platforms.classList.add('platforms');

    for (let i = 0; i < data.platforms.length; i++) {
      platforms.innerHTML += `<span class="${data.platforms[i]}"></span>`;
    }

    infoBlockElement.append(appNameElement, screenshots, reason, discount, platforms);

    return infoBlockElement;
  }
  
  function createSliderNavigationBlockElement(i) {
    const slideNavigateElement = document.createElement('div');
    slideNavigateElement.dataset.index = i;
    slideNavigateElement.addEventListener('click', (e) => {
      showSlide({ index: e.target.dataset.index });
    });
    sliderNavBlock.appendChild(slideNavigateElement);
  }
}



main();