#INCLUDE "Protheus.ch"
#INCLUDE "FWMVCDEF.ch"

/*/{Protheus.doc} User Function BRWSZ9
    (long_description)
    @type  Function
    @author user
    @since 05/11/2021
    @version version
    @param param_name, param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    @see 
    /*/
    
User Function BRWSZ9()
Local aArea := GetNextAlias()
Local oBrowseSZ9 //variavel obj que recebera o instancioamento da classe FWMbROWSE

oBrowseSZ9 := fwmbrowse():new()

//passo como parametro a tbl q
oBrowseSZ9 := setalias("SZ9")

obrowseSZ9 :=SetDescription("Tela de Protheuzeiros SZ9")

oBrowseSZ9 := SETONLYFILDES({"Z9_CODIGO,"Z9_NOME","Z9_SEXO","Z9_STATUS"})


obrowsesz9 :=AddLegend("SZ9-Z9_STATUS=='1","GREEN","ATIVO")
obrowsesz9 :=AddLegend("SZ9-Z9_STATUS=='1","RED","INATIVO")

//FILTRO
oBrowseSZ9 := SETFILTERDEFAULT("Z9_STATUS=='1'")
//DESATIVAR PARTE DE BAIXO
oBrowseSZ9 := DISABLEDETAILS()

obrowsesz9 :=ACTIVATE

restarea(aArea)

    
Return return_var
