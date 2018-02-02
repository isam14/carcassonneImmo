<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Annonce
 *
 * @ORM\Table(name="ann_annonce")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\AnnonceRepository")
 */
class Annonce
{
    /**
     * @var int
     *
     * @ORM\Column(name="ann_oid", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_titre", type="text")
     */
    private $titre;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_prix", type="string", length=255)
     */
    private $prix;

    /**
     * @var int
     *
     * @ORM\Column(name="ann_nbre_piece", type="integer")
     */
    private $nbrePiece;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_photo", type="string", length=255)
     */
    private $photo;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_description", type="text")
     */
    private $description;

    /**
     * @ORM\ManyToOne(targetEntity="User", inversedBy="annonces")
     * @ORM\JoinColumn(name="age_oid", referencedColumnName="age_oid")
     */
    private $agent;

    /**
     * @ORM\ManyToOne(targetEntity="TypeAnnonce", inversedBy="annonces")
     * @ORM\JoinColumn(name="typ_oid", referencedColumnName="typ_oid")
     */
    private $typeAnnonce;

    /**
     * @ORM\ManyToOne(targetEntity="Proprio", inversedBy="annonces")
     * @ORM\JoinColumn(name="pro_oid", referencedColumnName="pro_oid")
     */
    private $proprio;

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set titre
     *
     * @param string $titre
     *
     * @return Annonce
     */
    public function setTitre($titre)
    {
        $this->titre = $titre;

        return $this;
    }

    /**
     * Get titre
     *
     * @return string
     */
    public function getTitre()
    {
        return $this->titre;
    }

    /**
     * Set prix
     *
     * @param string $prix
     *
     * @return Annonce
     */
    public function setPrix($prix)
    {
        $this->prix = $prix;

        return $this;
    }

    /**
     * Get prix
     *
     * @return string
     */
    public function getPrix()
    {
        return $this->prix;
    }

    /**
     * Set nbrePiece
     *
     * @param integer $nbrePiece
     *
     * @return Annonce
     */
    public function setNbrePiece($nbrePiece)
    {
        $this->nbrePiece = $nbrePiece;

        return $this;
    }

    /**
     * Get nbrePiece
     *
     * @return int
     */
    public function getNbrePiece()
    {
        return $this->nbrePiece;
    }

    /**
     * Set photo
     *
     * @param string $photo
     *
     * @return Annonce
     */
    public function setPhoto($photo)
    {
        $this->photo = $photo;

        return $this;
    }

    /**
     * Get photo
     *
     * @return string
     */
    public function getPhoto()
    {
        return $this->photo;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Annonce
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }
}

