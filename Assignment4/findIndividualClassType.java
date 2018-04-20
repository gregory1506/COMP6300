// UWI ID : 03717357
// Course : COM6300
// Assignment : 4
public OWLIndividual findIndividualClassType(String individualName, String className){
    OWLClass testOWLClass = findOWLClass(className);
    String base1 = ont.getOntologyID().toString();
    String instanceBase = base1.substring(1, (base1.length() - 1)) +"#"+individualName;
    if(testOWLClass !=null){ 
        for (OWLIndividual ind : testOWLClass.getIndividuals(ont)) {
            String instIRI = ind.toString();
            String base = instIRI.substring(1, (instIRI.length() - 1));
            if(base.equals(instanceBase))
               return ind;
        }
    }
    return null;
}
