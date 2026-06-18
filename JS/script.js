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
