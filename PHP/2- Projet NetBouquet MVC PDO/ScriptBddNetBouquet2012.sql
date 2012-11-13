--
-- Base de données: netbouquet
--
-- --------------------------------------------------------

--
-- Structure de la table categorie
--

CREATE TABLE IF NOT EXISTS Categorie (
  id char(2) NOT NULL,
  libellé varchar(32) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table commande
--

CREATE TABLE IF NOT EXISTS Commande (
  id int(4) NOT NULL AUTO_INCREMENT,
  date_Commande date NOT NULL,
  loginUtilisateur varchar(7) NOT NULL,
  PRIMARY KEY (id),
  KEY loginUtilisateur (loginUtilisateur)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Structure de la table contenir
--

CREATE TABLE IF NOT EXISTS Contenir (
  idCommande int(4) NOT NULL,
  idProduit int(3) NOT NULL,
  qte int(2) NOT NULL,
  PRIMARY KEY (idCommande,idProduit),
  KEY idBouquet (idProduit)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table produit
--

CREATE TABLE IF NOT EXISTS Produit (
  id int(3) NOT NULL AUTO_INCREMENT,
  nom varchar(32) NOT NULL,
  image varchar(32) NOT NULL,
  description varchar(128) NOT NULL,
  prix float NOT NULL,
  idCategorie char(2) NOT NULL,
  PRIMARY KEY (id),
  KEY idCategorie (idCategorie)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- Structure de la table utilisateur
--

CREATE TABLE IF NOT EXISTS Utilisateur (
  login varchar(7) NOT NULL,
  nom varchar(32) NOT NULL,
  adresse varchar(64),
  cp char(5),
  ville varchar(32),
  tel varchar(10) DEFAULT NULL,
  mail varchar(32) DEFAULT NULL,
  mdp varchar(7) NOT NULL,
  statut varchar(6) NOT NULL DEFAULT 'client',
  PRIMARY KEY (login)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------

--
-- Contraintes pour les tables exportees
--


--
-- Contraintes pour la table contenir
--
ALTER TABLE Contenir
  ADD FOREIGN KEY FK_Contenir_COMMANDE (idCommande) REFERENCES Commande (id);
ALTER TABLE Contenir
  ADD FOREIGN KEY FK_Contenir_PRODUIT(idProduit) REFERENCES Produit (id);

--
-- Contraintes pour la table produit
--
ALTER TABLE Produit
  ADD FOREIGN KEY FK_Produit_CATEGORIE(idCategorie) REFERENCES Categorie (id);

  	--
-- Contraintes pour la table commande
--
ALTER TABLE Commande
  ADD FOREIGN KEY FK_Commande_UTILISATEUR (loginUtilisateur) REFERENCES Utilisateur (login);
  
--  -----------------------------------------------------------------------------
--        CREATION DES LIGNES DES TABLES
--  -----------------------------------------------------------------------------
-- Contenu de la table categorie

INSERT INTO Categorie (id, libelle) VALUES
('ba', 'bouquet accueil'),
('bb', 'bouquet bureau'),
('bf', 'bouquet fetes'),
('pa', 'plantes artificielles'),
('pv', 'plantes vertes');

-- --------------------------------------------------------
-- Contenu de la table produit

INSERT INTO Produit (id, nom, image, description, prix, idCategorie) VALUES
(1, 'Blanc', 'accueilblanc.jpg', 'Fleurs blanches dans un panier en osier', 34, 'ba'),
(2, 'Exotica', 'accueilhaute.jpg', 'Fleurs exotiques en hauteur', 35, 'ba'),
(3, 'Tradition', 'accueilpanier.jpg', 'Bouquet traditionnel', 28, 'ba'),
(4, 'Arbuste', 'artifarbre.jpg', 'Plante artificielle arbuste', 155, 'pa'),
(5, 'Japon', 'artifjaponais.jpg', 'Plante style japonais', 210, 'pa'),
(6, 'Palmier', 'artifpalmier.jpg', 'Palmier 2m50', 240, 'pa'),
(7, 'Jaune', 'bouquetjaune.jpg', 'Tout en fleurs jaunes', 25, 'bb'),
(8, 'Prune', 'bouquetprune.jpg', 'Fleurs prunes', 29, 'bb'),
(9, 'Fete', 'fetecentretable.jpg', 'Pour d?corer une table', 45, 'bf'),
(10, 'Noel', 'fetenoel.jpg', 'Couronne de Noel', 42, 'bf'),
(11, 'Printemps', 'feteoffrir.jpg', 'Fleurs roses et blanches', 32, 'bb'),
(12, 'Mixte', 'bouquetmixte.jpg', 'Fleurs mixtes', 32, 'bb'),
(13, 'Ficus', 'planteficus.jpg', 'Ficus 1m50', 130, 'pv'),
(14, 'Plante', 'plantefleurie.jpg', 'Plante et fleurs', 68, 'pv'),
(15, 'Variation', 'plantemixte.jpg', 'Plante et fleurs', 64, 'pv'),
(16, 'Orchi', 'planteorchi.jpg', 'Orchid', 55, 'pv'),

-- --------------------------------------------------------
-- Contenu de la table utilisateur

INSERT INTO Utilisateur (login, nom, adresse, CP, ville, tel, mail, mdp, statut) VALUES
('Logitec', 'Logitec', '1 rue de Paris', '93000', 'Bobigny', '0140405050', NULL, '1234abc', 'client'),
('Peps', 'Peps', '50 rue Berlioz', '93230', 'Romainville','0611223344', 'peps@laposte.net', 'peps', 'client');

-- --------------------------------------------------------
-- Contenu de la table commande

INSERT INTO Commande (id, dateCommande, loginUtilisateur) VALUES
(1, '2012-09-02', 'client'),
(2, '2012-09-15', 'client'),
(3, '2012-09-15', 'Logitec'),
(4, '2012-09-30', 'Peps'),
(7, '2012-10-05', 'Peps');

-- --------------------------------------------------------
-- Contenu de la table commander

INSERT INTO Contenir (idCommande, idProduit, qte) VALUES
(1, 1, 1),
(1, 2, 1);
