// UWI ID : 03717357
// Course : COM6300
// Assignment : 4
public OWLClass findOWLClass(String className) {
    boolean found = false;
    OWLClass testOWLClass = null;
    IRI testIRI = IRI.create(ont.getOntologyID().getOntologyIRI() + "#"+className);
    found = ont.containsClassInSignature(testIRI);
    if (found){
        testOWLClass = factory.getOWLClass(testIRI);
    }
    else  System.out.println("No class found for " + className) ;
    
    return testOWLClass;
} 