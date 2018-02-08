<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Vich\UploaderBundle\Form\Type\VichImageType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use \Gumlet\ImageResize;
use Symfony\Component\Form\Extension\Core\Type\SearchType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;


class AnnonceType extends AbstractType
{
    /**
    * {@inheritdoc}
    */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('titre')
        ->add('prix')
        ->add('nbrePiece')
        ->add('imageFile', VichImageType::class)
        ->add('photo')
        ->add('description')
        ->add('agent')
        ->add('typeAnnonce')
        ->add('proprio')
        ->add('typeAnnonce', ChoiceType::class, array(
            'choices' => array(
                'Locations' => true,
                'Ventes' => false,
                'Autres' => Null,
                
            )));
            
        }
        
        /**
        * {@inheritdoc}
        */
        public function configureOptions(OptionsResolver $resolver)
        {
            $resolver->setDefaults(array(
                'data_class' => 'AppBundle\Entity\Annonce'
            ));
        }
        
        /**
        * {@inheritdoc}
        */
        public function getBlockPrefix()
        {
            return 'appbundle_annonce';
        }
        
        public function listAction(Request $request){
            $form = $this->createFormBuilder()
            ->add("recherche", SearchType::class, array(
                'required' => false,
                ))
                ->add("type", EntityType::class, array(
                    'class' => 'AppBundle:TypeAnnonce',
                    'placeholder' => 'Sélectionner un type d\'annonce',
                    'required' => false,
                    ))
                    ->getForm();
                    
                }
                
                
            }
            