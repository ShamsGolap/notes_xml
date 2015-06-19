<?php

$leDocumentDOM = new DOMDocument();

$leDocumentDOM->preserveWhiteSpace = false;
$leDocumentDOM->formatOutput = true;

$leDocumentDOM->load('notes.xml');
$leRequeteurXPath = new DOMXPath($leDocumentDOM);

$lastIdNote = $leRequeteurXPath->query('//note[@id][last()]')->item(0)->getAttribute('id');

$date_creation = $_POST['date'];
$titre = $_POST['titre'];
$destinataire = $_POST['destinataire'];
$auteur = $_POST['auteur'];
$contenu = $_POST['contenu'];

$currentIdNote = $lastIdNote+1;

$leNoeudNouvelleNote = $leDocumentDOM->createElement("note");
$leNoeudNouvelleNote->setAttribute("id", $currentIdNote);
$leNoeudNouvelleNote->setAttribute("date_creation", htmlspecialchars($date_creation));
$leNoeudNouvelleNote->setAttribute("titre", htmlspecialchars($titre));

$leDestinataire = $leDocumentDOM->createElement("to");
$leDestinataire->setAttribute("nom", htmlspecialchars($destinataire));
$leDestinataire->setAttribute("prenom", "");

$lAuteur = $leDocumentDOM->createElement("from");
$lAuteur->setAttribute("nom", htmlspecialchars($auteur));
$lAuteur->setAttribute("prenom", "");

$leContenu = $leDocumentDOM->createElement("texte", htmlspecialchars($contenu));

$laRacine = $leDocumentDOM->documentElement;
$laRacine->appendChild($leNoeudNouvelleNote);
$leNoeudNouvelleNote->appendChild($leDestinataire);
$leNoeudNouvelleNote->appendChild($lAuteur);
$leNoeudNouvelleNote->appendChild($leContenu);

if(empty($titre) || empty($destinataire) || empty($auteur) || empty($contenu))
{
	header("Location: index.php");
}
else
{
	$leDocumentDOM->save('notes.xml');
	header("Location: index.php#note$currentIdNote");
}

?>
