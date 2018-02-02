<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Proprio;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Proprio controller.
 *
 * @Route("admin/proprio")
 */
class ProprioController extends Controller
{
    /**
     * Lists all proprio entities.
     *
     * @Route("/", name="admin_proprio_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $proprios = $em->getRepository('AppBundle:Proprio')->findAll();

        return $this->render('proprio/index.html.twig', array(
            'proprios' => $proprios,
        ));
    }

    /**
     * Creates a new proprio entity.
     *
     * @Route("/new", name="admin_proprio_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $proprio = new Proprio();
        $form = $this->createForm('AppBundle\Form\ProprioType', $proprio);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($proprio);
            $em->flush();

            return $this->redirectToRoute('admin_proprio_show', array('id' => $proprio->getId()));
        }

        return $this->render('proprio/new.html.twig', array(
            'proprio' => $proprio,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a proprio entity.
     *
     * @Route("/{id}", name="admin_proprio_show")
     * @Method("GET")
     */
    public function showAction(Proprio $proprio)
    {
        $deleteForm = $this->createDeleteForm($proprio);

        return $this->render('proprio/show.html.twig', array(
            'proprio' => $proprio,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing proprio entity.
     *
     * @Route("/{id}/edit", name="admin_proprio_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Proprio $proprio)
    {
        $deleteForm = $this->createDeleteForm($proprio);
        $editForm = $this->createForm('AppBundle\Form\ProprioType', $proprio);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('admin_proprio_edit', array('id' => $proprio->getId()));
        }

        return $this->render('proprio/edit.html.twig', array(
            'proprio' => $proprio,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a proprio entity.
     *
     * @Route("/{id}", name="admin_proprio_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Proprio $proprio)
    {
        $form = $this->createDeleteForm($proprio);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($proprio);
            $em->flush();
        }

        return $this->redirectToRoute('admin_proprio_index');
    }

    /**
     * Creates a form to delete a proprio entity.
     *
     * @param Proprio $proprio The proprio entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Proprio $proprio)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('admin_proprio_delete', array('id' => $proprio->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
