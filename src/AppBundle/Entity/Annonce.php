<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;


/**
 * Annonce
 * @ORM\Entity
 * @Vich\Uploadable
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
     * @Vich\UploadableField(mapping="annonce_photos", fileNameProperty="photo")
     * @var File
     */
    private $imageFile;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     * @var \DateTime
     */
    private $updatedAt;

    /**
     * @var string
     *
     * @ORM\Column(name="ann_description", type="text")
     */
    private $description;

    /**
     * @ORM\ManyToOne(targetEntity="User")
     * @ORM\JoinColumn(name="age_oid", referencedColumnName="age_oid")
     */
    private $agent;

    /**
     * @ORM\ManyToOne(targetEntity="TypeAnnonce")
     * @ORM\JoinColumn(name="typ_oid", referencedColumnName="typ_oid")
     */
    private $typeAnnonce;

    /**
     * @ORM\ManyToOne(targetEntity="Proprio")
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

    /**
     * Set agent
     *
     * @param \AppBundle\Entity\User $agent
     *
     * @return Annonce
     */
    public function setAgent(\AppBundle\Entity\User $agent = null)
    {
        $this->agent = $agent;

        return $this;
    }

    /**
     * Get agent
     *
     * @return \AppBundle\Entity\User
     */
    public function getAgent()
    {
        return $this->agent;
    }

    /**
     * Set typeAnnonce
     *
     * @param \AppBundle\Entity\TypeAnnonce $typeAnnonce
     *
     * @return Annonce
     */
    public function setTypeAnnonce(\AppBundle\Entity\TypeAnnonce $typeAnnonce = null)
    {
        $this->typeAnnonce = $typeAnnonce;

        return $this;
    }

    /**
     * Get typeAnnonce
     *
     * @return \AppBundle\Entity\TypeAnnonce
     */
    public function getTypeAnnonce()
    {
        return $this->typeAnnonce;
    }

    /**
     * Set proprio
     *
     * @param \AppBundle\Entity\Proprio $proprio
     *
     * @return Annonce
     */
    public function setProprio(\AppBundle\Entity\Proprio $proprio = null)
    {
        $this->proprio = $proprio;

        return $this;
    }

    /**
     * Get proprio
     *
     * @return \AppBundle\Entity\Proprio
     */
    public function getProprio()
    {
        return $this->proprio;
    }

    /**
     * @param File|\Symfony\Component\HttpFoundation\File\UploadedFile
     *
     * @return Photo
    */
    public function setImageFile(File $photo = null)
    {
        $this->imageFile = $photo;

        // VERY IMPORTANT:
        // It is required that at least one field changes if you are using Doctrine,
        // otherwise the event listeners won't be called and the file is lost
        if ($photo) {
            // if 'updatedAt' is not defined in your entity, use another property
            $this->updatedAt = new \DateTime('now');
            // $this->updatedAt = new \DateTimeImmutable();
        }
    }

    public function getImageFile()
    {
        return $this->imageFile;
    }

    
}

