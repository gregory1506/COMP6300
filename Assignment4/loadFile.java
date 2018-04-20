public void loadFile(String fileloc) {
    try {
        // Create a file object that points to the local copy
        File file = new File(ontloc);
        // Now load the local copy 
        OWLOntology ont = manager.loadOntologyFromOntologyDocument(file);
        System.out.println("Loaded ontology: " + ont);
    }
    catch (OWLOntologyCreationException e) {
        System.out.println("Could not load ontology: " + e.getMessage());
    }   
}