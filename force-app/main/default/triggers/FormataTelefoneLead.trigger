trigger FormataTelefoneLead on Lead (before insert, before update) {
    for (Lead leadAtual : Trigger.new) {
        if (String.isNotBlank(leadAtual.Phone)) {
            
            // Remove TUDO que não for número
            String apenasNumeros = leadAtual.Phone.replaceAll('\\D', '');
            
            // Se tiver 11 números (Celular) -> (XX) XXXXX-XXXX
            if (apenasNumeros.length() == 11) {
                leadAtual.Phone = '(' + apenasNumeros.substring(0, 2) + ') ' + 
                                  apenasNumeros.substring(2, 7) + '-' + 
                                  apenasNumeros.substring(7);
            } 
            // Se tiver 10 números (Fixo) -> (XX) XXXX-XXXX
            else if (apenasNumeros.length() == 10) {
                leadAtual.Phone = '(' + apenasNumeros.substring(0, 2) + ') ' + 
                                  apenasNumeros.substring(2, 6) + '-' + 
                                  apenasNumeros.substring(6);
            }
        }
    }
}