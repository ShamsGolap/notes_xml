<?php

$idNoteToDelete = substr($_POST['noteToDel'], 5);

$leDocumentDOM = new DOMDocument();

$leDocumentDOM->preserveWhiteSpace = false;
$leDocumentDOM->formatOutput = true;

$leDocumentDOM->load('notes.xml');

$laRacine = $leDocumentDOM->documentElement;

$notes = $laRacine->getElementsByTagName('note');

foreach ($notes as $note)
{
	if($note->hasAttribute('id') == $idNoteToDelete)
	{
		if($note->getAttribute('id') == $idNoteToDelete)
		{
			$laRacine->removeChild($note);
		}
	}
}

if(empty($idNoteToDelete))
{
	header('Location: index.php');
}
else
{
	$leDocumentDOM->save('notes.xml');
	header('Location: index.php');	
}

?>
