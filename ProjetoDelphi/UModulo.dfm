object DM: TDM
  OldCreateOrder = False
  Height = 319
  Width = 390
  object RESTClient1: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://localhost/wsfeira'
    Params = <>
    Left = 168
    Top = 16
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 168
    Top = 72
  end
  object RESTResponse1: TRESTResponse
    Left = 168
    Top = 128
  end
  object RDAluno: TRESTResponseDataSetAdapter
    Dataset = Aluno
    FieldDefs = <>
    Response = RESTResponse1
    Left = 24
    Top = 192
  end
  object Aluno: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 24
    Top = 248
    object AlunoALUCODIGO: TIntegerField
      FieldName = 'ALUCODIGO'
    end
    object AlunoALUNNOME: TStringField
      FieldName = 'ALUNNOME'
    end
    object AlunoCODIGOPRO: TIntegerField
      FieldName = 'CODIGOPRO '
    end
  end
  object RDControle: TRESTResponseDataSetAdapter
    Dataset = Controle
    FieldDefs = <>
    Response = RESTResponse1
    Left = 88
    Top = 192
  end
  object Controle: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 88
    Top = 248
    object ControleCONCODIGO: TIntegerField
      FieldName = 'CONCODIGO'
    end
    object ControleCODIGOUSU: TIntegerField
      FieldName = 'CODIGOUSU'
    end
    object ControlePROJ1: TIntegerField
      FieldName = 'PROJ1'
    end
    object ControlePROJ2: TIntegerField
      FieldName = 'PROJ2'
    end
    object ControlePROJ3: TIntegerField
      FieldName = 'PROJ3'
    end
    object ControlePROJ4: TIntegerField
      FieldName = 'PROJ4'
    end
  end
  object RDEixo: TRESTResponseDataSetAdapter
    Dataset = Eixo
    FieldDefs = <>
    Response = RESTResponse1
    Left = 144
    Top = 192
  end
  object Eixo: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 248
    object EixoEIXCODIGO: TIntegerField
      FieldName = 'EIXCODIGO '
    end
    object EixoEIXONOME: TStringField
      FieldName = 'EIXONOME'
    end
  end
  object RDNota: TRESTResponseDataSetAdapter
    Dataset = Nota
    FieldDefs = <>
    Response = RESTResponse1
    Left = 200
    Top = 192
  end
  object Nota: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 200
    Top = 248
    object NotaNOTCODIGO: TIntegerField
      FieldName = 'NOTCODIGO '
    end
    object NotaCODIGOALU: TIntegerField
      FieldName = 'CODIGOALU '
    end
    object NotaNOTAIND: TStringField
      FieldName = 'NOTAIND'
      Size = 0
    end
    object NotaNOTAGRP: TStringField
      FieldName = 'NOTAGRP'
    end
  end
  object RDProjeto: TRESTResponseDataSetAdapter
    Active = True
    Dataset = Projeto
    FieldDefs = <>
    Response = RESTResponse1
    Left = 264
    Top = 192
  end
  object Projeto: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'PROCODIGO '
        DataType = ftInteger
      end
      item
        Name = 'PRONOME '
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 264
    Top = 248
    object ProjetoPROCODIGO: TIntegerField
      FieldName = 'PROCODIGO '
    end
    object ProjetoPROEIXO: TStringField
      FieldKind = fkCalculated
      FieldName = 'PROEIXO'
      Calculated = True
    end
    object ProjetoPRONOME: TStringField
      FieldName = 'PRONOME '
    end
  end
  object RDUsuario: TRESTResponseDataSetAdapter
    Dataset = Usuario
    FieldDefs = <>
    Response = RESTResponse1
    Left = 328
    Top = 192
  end
  object Usuario: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 328
    Top = 248
    object UsuarioUSUCODIGO: TIntegerField
      FieldName = 'USUCODIGO '
    end
    object UsuarioUSUCPF: TStringField
      FieldName = 'USUCPF'
      Size = 40
    end
    object UsuarioUSUNOME: TStringField
      FieldName = 'USUNOME'
    end
    object UsuarioUSUDTNASC: TDateField
      FieldName = 'USUDTNASC'
    end
    object UsuarioUSUTIPO: TStringField
      FieldName = 'USUTIPO'
    end
  end
end
