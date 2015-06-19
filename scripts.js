function date_heure(id)
{
	date = new Date;
	annee = date.getFullYear();
	mois = date.getMonth();
	lesMois = new Array('Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre');
	j = date.getDate();
	jour = date.getDay();
	lesJours = new Array('Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi');
	h = date.getHours();

	if(h < 10)
	{
		h = "0"+h;
	}

	m = date.getMinutes();

	if(m < 10)
	{
		m = "0"+m;
	}

	s = date.getSeconds();

	if(s < 10)
	{
		s = "0"+s;
	}

	resultat = 'Nous sommes le ' + lesJours[jour] + ' ' + j + ' ' + lesMois[mois] + ' ' + annee + '. Il est ' + h + ':' + m + ':' + s;
	document.getElementById(id).innerHTML = resultat;
	setTimeout('date_heure("' + id + '");', '1000');
	return true;
}

function maDate()
{
	date = new Date;
	annee = date.getFullYear();
	mois = date.getMonth();
	lesMois = new Array('Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre');
	j = date.getDate();
	jour = date.getDay();
	resultat = j + ' ' + lesMois[mois] + ' ' + annee;
	document.forms['formAjouterNote'].elements['date'].value = resultat;
	return true;
}
