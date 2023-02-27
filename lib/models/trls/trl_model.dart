class TrlModel {
  static List<String> mainIssues = [
    "Os princípios básicos foram observados e relatados?",
    "Conceito de tecnologia e/ou aplicação foi formulada?",
    "Função crítica analítica e experimental e/ou prova de conceito característica realizada?",
    "Validação de componentes e/ou placas de ensaio em ambiente de laboratório realizada?",
    "Validação de componente e/ou placa de ensaio em ambiente relevante realizada?",
    "Modelo de sistema/subsistema ou protótipo em um ambiente relevante demonstrado?",
    "Protótipo do sistema em ambiente oceânico demonstrado?",
    "Sistemas reais concluídos e “qualificados para missões oceânicas” por meio de teste e demonstração?",
    "Sistema real comprovado por meio de operações de missão bem-sucedidas?",
  ];

  static List<List<String>> hardSecIssues = [
    // TRL 1
    [
      "Foram identificados os usuários potenciais do ODAS? (Motivação)",
      "O ambiente de operação, as variáveis oceânicas de interesse e suas formas de obtenção foram identificados? (Objetivos)",
      "Foram compreendidos os princípios básicos de funcionamento dos elementos típicos de um ODAS in situ (para o Hardware)?",
      "Plataformas e variáveis oceânicas a serem medidas pelo ODAS foram identificadas?",
      "Foram definidas leis físicas e/ou suposições que suportem um ODAS com inovação (para o Hardware)?",
      "O Hardware foi idealizado?"
      //"Foram compreendidas as características principais de elementos que devem constituir o ODAS?"
      //    "(Plataforma de instalação, Microcontroladores, Instrumentos/Transdutores/Sensores, Sistemas de energia, de armazenamento, de comunicação, de segurança, entre outros)",
      //"Foram definidos local e pessoal de desenvolvimento do ODAS?",
    ],
    // TRL 2
    [
      //"Foram definidas as aplicações potenciais para a futura operação do sistema?",

      "Os Requisitos de Desempenho foram definidos e inicialmente quantificados e/ou qualificados (para o Hardware)?",
      "Os conceitos das inovações propostas são viáveis (para o Hardware)?",
      "Um ODAS potencial especificado tecnicamente foi identificado (para o Hardware)?", //seleção de componentes no mercado
      //"Foram estudadas tecnologias a serem desenvolvidas/aquisitadas com base nos requisitos de desempenho definidos?"
      //    "(Microcontroladores, instrumentos, fontes de energia, adaptadores, entre outros)",
      //"Estudos em papel mostram que a tecnologia é viável?",
      //"Foram definidos os elementos do ODAS que deverão ser aquisitados?",
      "Os primeiros experimentos necessários para o desenvolvimento foram planejados (para o Hardware)?",
    ],
    // TRL 3
    [
      "Os desempenhos requisitados foram alcançados inicialmente (para o Hardware)?", //testes iniciais nos componentes aquisitados
      
      //"Foi realizada a seleção e aquisição de elementos constituintes?",
    ],
    // TRL 4
    [""],
    // TRL 5
    [""],
    // TRL 6
    [""],
    // TRL 7
    [""],
    // TRL 8
    [""],
    // TRL 9
    [""],
  ];

  static List<List<String>> softSecIssues = [
    // TRL 1
    [
      "Foram compreendidos os princípios básicos de funcionamento dos elementos típicos de um ODAS in situ (para o Software)?",
      "Foram definidas leis físicas e/ou suposições que suportem um ODAS com inovação (para o Software)?",
      "O Software foi idealizado?"
    ],
    // TRL 2
    [
      "Os Requisitos de Desempenho foram definidos e inicialmente quantificados e/ou qualificados (para o Software)?",
      "Os conceitos das inovações propostas são viáveis (para o Software)?",
      "Os primeiros experimentos necessários para o desenvolvimento foram planejados (para o Software)?",
      "Uma primeira versão do Software foi codificada?",
    ],
    // TRL 3
    ["Os desempenhos requisitados foram alcançados inicialmente (para o Software)?",
      ],
    // TRL 2
    [""],
    // TRL 2
    [""],
    // TRL 2
    [""],
    // TRL 2
    [""],
    // TRL 2
    [""],
    // TRL 2
    [""],
  ];

  static int getNumberSecIssues(bool hardware, int trl) {
    if (hardware) {
      return hardSecIssues[trl - 1].length;
    } else {
      return softSecIssues[trl - 1].length;
    }
  }

  static String getSecIssue(bool hardware, int trl, int question) {
    if (hardware) {
      return hardSecIssues[trl - 1][question - 1];
    } else {
      return softSecIssues[trl - 1][question - 1];
    }
  }
}
