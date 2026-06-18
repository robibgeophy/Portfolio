function mostrarCategoria(event, id){

    let categorias = document.querySelectorAll('.categoria');

    categorias.forEach(cat => {
        cat.style.display = 'none';
    });

    document.getElementById(id).style.display = 'block';

    let botones = document.querySelectorAll('.tab-btn');

    botones.forEach(btn => {
        btn.classList.remove('active');
    });

    event.target.classList.add('active');
}
