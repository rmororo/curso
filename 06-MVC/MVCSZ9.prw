#INCLUDE "Protheus.ch"
#INCLUDE "FWMVCDEF.ch"


/*/{Protheus.doc} User Function MVCSZ9
    (long_description)
    @type  Function
    @author user
    @since 05/11/2021
    @version version
    @param param_ame, param_type, param_descr
    @return , return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    /*/
User Function nomeFunction()
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
    
Return 

/*/{Protheus.doc} nomeStaticFunction
STATIC FUNCIONTIO MODELDEF
    (long_description)
    @type  Static Function
    @author user
    @since 05/11/2021
    @version version
    @param , param_type, param_descr
    @return oModel, objeto , objeto da funcao MVC
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function nomeStaticFunction()
    oModel :=NIL

    oStrucSZ9 :=FWFormStruc(1,"SZ9") // TRAS ESTRUTURA DA TBL E CARACTERISTICAS DO CAMPOS, COM PARAMETRO 1

    oModel := MPFormModel(): new("MCVSZ9M")

    oModel:addFields("FORMSZ9",/"OWNER"/,oStrucSZ9)
//chave primmaria se nao estive ja no SX2
    oModel:SetprimaryKey("Z9_FILIAL","Z9_CODIGO")

    oModel:SetDescription("Modelo de dados do Cadastro")

    oModel:getmodel("FORMSZ9"):SetDescription("Formulario Cadastro")


Return oModel

/*/{Protheus.doc} oView
    (long_description)
    @type  Static Function
    @author RicardoMororo
    @since 07/11/2021
    @version version
    @param , param_type, param_descr
    @return oView, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
    https://tdn.totvs.com/display/framework/FWLoadModel
    https://tdn.totvs.com/display/framework/FWFormView

/*/
Static Function ViewDef()
Local oView :=NIL

//funcao que retorna um objeto de model de determinado fonte
// esta aqui mesmo
Local oModel := FwLoadModel("MVCSZ9")

oStrucSZ9 :=FWFormStruc(2,"SZ9") // TRAS ESTRUTURA DA TBL E CARACTERISTICAS DO CAMPOS, COM PARAMETRO 1

//CONSTRUINDO A PARTE DE VISAO DOS DADOS
oView := fwformview() : new()

//PASSADO O MODELO DE DADOS INFORMADO
oView:setmode(oModel)

//ATRIBUIÇÃO DA ESTRUTURA DE DADOS A CAMADA DE VISAO
oView:addField("VIEWSZ9",oStrucSZ9,"FORMSZ9")

//criando um container com identificador TELA
oView:createHorizontalBox("Tela",100)

oView:EnableTitleview("FORMSZ9","Visualização Desenvolvedores")

//FORCA O FECHAMANETO DA JANELA PASSANDO O PARAMETRO .T.
oView:setcloseonok({||.T.)}


oView:setownerview("VIEWSZ9","TELA")

Return oView


/*/{Protheus.doc} MenuDef
    (long_description)
    @type  Static Function
    @author user
    @since 07/11/2021
    @version version
    @param , param_type, param_descr
    @return return_var, return_type, return_description
    @example
    (examples)
    @see (links_or_references)
/*/
Static Function MenuDef()

aRotina := {}

add option aRotina Title  'Visualizar'  action 'VIEWDEF.MVSZ9'       operator 2 accesS 0
add option aRotina Title  'Incluir'     action 'VIEWDEF.MVSZ9'       operator 3 accesS 0
add option aRotina Title  'Alterar'     action 'VIEWDEF.MVSZ9'       operator 4 accesS 0
add option aRotina Title  'Excluir'     action 'VIEWDEF.MVSZ9'       operator 5 accesS 0


Return aRotina
