function mostrarCategoria(event, id) {

    const categorias = document.querySelectorAll('.categoria');

    categorias.forEach(cat => {
        cat.classList.remove('activa');
    });

    document.getElementById(id).classList.add('activa');

    const botones = document.querySelectorAll('.tab-btn');

    botones.forEach(btn => {
        btn.classList.remove('active');
    });

    event.currentTarget.classList.add('active');
}

var TrandingSlider = new Swiper('.tranding-slider', {
    effect: 'coverflow',
    grabCursor: true,
    centeredSlides: true,
    loop: true,
    slidesPerView: 'auto',
    coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 100,
        modifier: 2.5,
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    }

});
