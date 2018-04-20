public OWLObjectProperty findObjectProperty (String objectPropertyName){ 
    String base1 = ont.getOntologyID().toString();
    String base = base1.substring(1, (base1.length() - 1));
    OWLObjectProperty prop = factory.getOWLObjectProperty(IRI.create(base + "#" +objectPropertyName));
    return prop;
} 