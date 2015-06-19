<?php
echo '<!DOCTYPE html>';
$leDocumentXML = new DOMDocument();
$leDocumentXML->load('notes.xml');

$leDocumentXSL = new DOMDocument();
$leDocumentXSL->load('notes.xsl');

$leProcesseurXSLT = new XSLTProcessor();
$leProcesseurXSLT->importStylesheet($leDocumentXSL);
echo $leProcesseurXSLT->transformToXML($leDocumentXML);
?>