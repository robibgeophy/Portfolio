<script>
function mostrarCategoria(id){

	let categorías = document.querySelectorAll('.categoria');

	categorías.forEach(cat => {
		cat.style.display = 'none';
	});

	document.getElementById(id).style.display = 'block';

	let botones = document.querySelectorAll('.tab-btn');

	botones.forEach(btn => {
		btn.classList.remove('active');
	});

	evento.target.classList.add('active');
}
</script>