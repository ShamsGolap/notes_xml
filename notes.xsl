<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="utf-8"/>
	<xsl:template match="/">
		<html lang="FR-fr">
			<head>
				<title>Bloc Notes</title>
				<meta charset="utf-8"/>
				<link rel="stylesheet" type="text/css" href="style.css"/>
				<link rel="shortcut icon" href="img/icon_notes.jpg" type="image/x-icon"/>
				<script type="text/javascript" src="scripts.js"></script>
			</head>
			<body>
				<header class="en_tete_blocnotes"><a href="">
					<h1><xsl:value-of select="bloc_notes/@nom"/></h1></a>
					<hr />
				</header>

				<nav>
					<fieldset>
						<select onchange="
							selected = this.options[this.selectedIndex].value; 
							location = selected; 
							titreNoteAccedee = document.getElementById(selected.substr(1)).firstChild.firstChild; 
							autresNotes = document.getElementsByTagName('h2'); 
							for (i=0; i&lt;autresNotes.length; i++)autresNotes.item(i).style.backgroundColor='transparent';
							for (i=0; i&lt;autresNotes.length; i++)autresNotes.item(i).style.color='white';
							titreNoteAccedee.style.backgroundColor = 'white'; 
							titreNoteAccedee.style.color = 'black';
							">
							<option label="Accéder à une note ..." value="" selected="selected"/>
							<xsl:for-each select="bloc_notes/note">
								<xsl:variable name="id_note" select="@id"/>
								<xsl:element name="option">
									<xsl:attribute name="value">#note<xsl:value-of select="$id_note"/></xsl:attribute>
									<xsl:attribute name="label"><xsl:value-of select="@titre"/></xsl:attribute>
									<xsl:value-of select="@titre"/>
								</xsl:element>
							</xsl:for-each>
						</select>
					</fieldset>
					<fieldset>
						<legend>Créer une nouvelle note</legend>
						<form method="post" name="formAjouterNote" action="ajouterNote.php">
							<input type="text" name="titre" placeholder=" Titre" maxlength="30" required="required"/><br />
							<input type="text" name="auteur" placeholder=" Auteur" required="required"/><br />
							<input type="text" name="destinataire" placeholder=" Destinataire" required="required"/><br />
							<textarea rows="3" name="contenu" placeholder=" Entrez le contenu de la note ..." required="required"/>
							<input type="hidden" name="date" value=""/>
							<script type="text/javascript">window.onload = maDate();</script>
							<input type="submit" name="add" value="Ajouter la note"/>
						</form>
					</fieldset>
					<fieldset>
						<legend>Supprimer une note</legend>
						<form method="post" name="formDeleteNote" action="supprimerNote.php">
							<select name="noteToDel" onchange="
								selected = this.options[this.selectedIndex].value; 
								location = selected; 
								titreNoteToDel = document.getElementById(selected.substr(1)).firstChild.firstChild; 
								autresNotes = document.getElementsByTagName('h2');
								for (i=0; i&lt;autresNotes.length; i++)autresNotes.item(i).style.backgroundColor='transparent';
								for (i=0; i&lt;autresNotes.length; i++)autresNotes.item(i).style.color='white';
								titreNoteToDel.style.backgroundColor = 'red'; 
								titreNoteToDel.style.color = 'white';
								">
								<option label="Supprimer une note ..." value="" selected="selected"/>
								<xsl:for-each select="bloc_notes/note">
									<xsl:variable name="id_note" select="@id"/>
									<xsl:element name="option">
										<!-- <xsl:attribute name="name"><xsl:value-of select="$id_note"></xsl:value-of></xsl:attribute> -->
										<xsl:attribute name="value">#note<xsl:value-of select="$id_note"/></xsl:attribute>
										<xsl:attribute name="label"><xsl:value-of select="@titre"/></xsl:attribute>
										<xsl:value-of select="@titre"/>
									</xsl:element>
								</xsl:for-each>
							</select>
							<input type="submit" name="del" value="Supprimer la note"/>
						</form>
					</fieldset>
				</nav>

				<section class="notes">
					<xsl:for-each select="bloc_notes/note">

						<xsl:element name="article">
							<xsl:attribute name="class">note</xsl:attribute>
							<xsl:attribute name="id">note<xsl:value-of select="@id"/></xsl:attribute>
							<header>
								<!-- <h2 name="titreNote" class="titreNote"><xsl:value-of select="@titre"/></h2> -->
								<h2 class="titreNote"><xsl:value-of select="@titre"/></h2>
								<h5 class="date_note"><xsl:value-of select="@date_creation"/></h5>
							</header>

							<section>
								<p>
									<xsl:value-of select="texte"/>
									<xsl:variable name="content_length" select="string-length(texte)"/>
									<!-- <xsl:if test="$content_length &gt; 160">
										<a id="lirelasuite" onclick="document.getElementById('lirelasuite1').style.display='inline'; this.style.display='none';">Lire la suite ...</a>
										<span id="lirelasuite1" style="display: none;">

											<a id="lirelasuite" onclick="document.getElementById('lirelasuite1').style.display='none'; document.getElementById('lirelasuite').style.display='inline';">Masquer la note</a>
										</span>
									</xsl:if> -->
								</p>
							</section>

							<footer>
								<h5>De : <xsl:value-of select="from/@nom"/> | Vers : <xsl:value-of select="to/@nom"/></h5>
							</footer>

						</xsl:element>

						<hr />
					</xsl:for-each>
				</section>

				<footer class="footer_retour_site">
					<a class="retour_site" href="#">Retour en haut</a>
					<span id="date_heure"></span><script type="text/javascript">window.onload = date_heure('date_heure');</script>
				</footer>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
