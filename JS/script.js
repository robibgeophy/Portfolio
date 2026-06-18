function mostrarCategoria(event, id) {

    const categorias = document.querySelectorAll('.categoria');

    categorias.forEach(categoria => {
        categoria.style.display = 'none';
    });

    document.getElementById(id).style.display = 'block';

    const botones = document.querySelectorAll('.tab-btn');

    botones.forEach(boton => {
        boton.classList.remove('active');
    });

    event.target.classList.add('active');
}
