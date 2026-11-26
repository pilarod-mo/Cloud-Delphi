# Cloud Delphi ponderado — artículo completo autocontenido
# Guardar este archivo en UTF-8. Ejecutar con Source en RStudio.
# Requiere tinytex y una distribución LaTeX (por ejemplo TinyTeX).
# Instalación inicial, si hace falta:
# install.packages("tinytex")
# tinytex::install_tinytex()

# Manuscrito LaTeX íntegro (versión rápida que funcionó en Overleaf).
articulo <- r"---(\documentclass[11pt,a4paper]{article}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[spanish]{babel}
\usepackage{amsmath,amssymb}
\usepackage[round,authoryear]{natbib}
\usepackage{geometry}
\geometry{margin=2.5cm}
\usepackage{hyperref}
\title{Método Cloud Delphi ponderado}
\author{Autores por completar}
\date{}
\begin{document}
\maketitle
\begin{abstract}
Se presenta una formulación del método Cloud Delphi ponderado para establecer puntos de corte mediante la integración del juicio experto y la teoría de respuesta al ítem. El procedimiento representa intervalos de valoración mediante expectativa, entropía e hiperentropía, y traduce fronteras conceptuales a la escala de habilidad mediante dos estimadores locales. Se describen simulaciones E0--E7 y una extensión jerárquica cuya evaluación permanece pendiente.
\end{abstract}
\section{Introducción}


El establecimiento de estándares de desempeño constituye uno de los problemas centrales en la medición educativa, en tanto determina la interpretación de los puntajes y sustenta decisiones relevantes en contextos de evaluación a gran escala. En particular, la definición de puntos de corte permite clasificar a los examinados en niveles de desempeño cualitativamente diferenciados, lo que resulta fundamental para el diagnóstico, la certificación y la formulación de políticas educativas \citep{ferrara2026,pant2009,rodriguez2025}. A pesar de los avances metodológicos desarrollados en las últimas décadas \citep{cizek2007}, este proceso continúa siendo objeto de debate, en gran medida debido a la sensibilidad de los resultados a los métodos utilizados y a la variabilidad inherente al juicio experto \citep{jaeger1989,cizek2007}.

Tradicionalmente, los métodos de establecimiento de puntos de corte han estado fuertemente basados en el juicio de expertos, como ocurre en los enfoques de Angoff o Bookmark \citep{lewis1996,sridharan2025}. Sin embargo, estos métodos presentan limitaciones conocidas, entre ellas la elevada carga cognitiva impuesta a los jueces y la ausencia de mecanismos formales para modelar la incertidumbre y la variabilidad en sus juicios. En respuesta a estas limitaciones, se han desarrollado enfoques que buscan integrar modelos psicométricos, particularmente la Teoría de Respuesta al Ítem (TRI), con el juicio experto, con el objetivo de aprovechar simultáneamente la información empírica del banco de ítems y el conocimiento sustantivo de los especialistas. 

Desde una perspectiva más general, este tipo de integración se inscribe dentro del marco de la modelización psicométrica de variables latentes, en la que se busca representar formalmente la relación entre observaciones empíricas y constructos no observados. En este sentido, los desarrollos contemporáneos en psicometría han enfatizado la necesidad de especificar modelos explícitos que permitan evaluar la validez, la fiabilidad y las fuentes de error en las mediciones \citep{beaujean2014,raykov2011}. En particular, estos autores destacan que los modelos psicométricos constituyen herramientas fundamentales para vincular la teoría sustantiva con los datos observados y para examinar de manera rigurosa las fuentes de variabilidad presentes en los procesos de medición.

En esta línea, el método propuesto por García y colaboradores (2013) representa un avance significativo al establecer una conexión formal entre la escala de habilidad y los niveles de desempeño mediante el uso de curvas características de los ítems. En este enfoque, los puntos de corte se determinan a partir de curvas características conjuntas que representan el comportamiento esperado de ítems asociados a cada nivel. No obstante, este método asume que los ítems asignados a cada nivel representan de manera homogénea dicho nivel, lo cual puede resultar problemático en bancos de ítems heterogéneos.

Con el objetivo de superar esta limitación, trabajos posteriores han propuesto integrar mecanismos de ponderación que reflejen la contribución diferencial de los ítems junto con procedimientos más flexibles para la elicitación del juicio experto. En este contexto, se ha incorporado el método Cloud Delphi \citep{yangz2012} como una herramienta para modelar la incertidumbre en las valoraciones de los jueces. Este enfoque combina elementos de la teoría de la probabilidad y de la lógica difusa mediante el denominado modelo de nube, en el cual un concepto cualitativo se representa a través de tres parámetros: esperanza, entropía e hiperentropía. Mientras que la esperanza captura el valor central del concepto, la entropía refleja el grado de dispersión o incertidumbre, y la hiperentropía modela la variabilidad de dicha incertidumbre.

El método Cloud Delphi permite a los jueces expresar sus juicios en forma de intervalos sobre una escala continua de desempeño, en lugar de proporcionar estimaciones puntuales \citep{yangy2013}. El punto medio del intervalo representa el valor central del juicio, mientras que su amplitud refleja el grado de incertidumbre del juez. A partir de estos intervalos, se construyen nubes individuales que posteriormente se agregan en una nube sintética y una nube ponderada, cuya esperanza se interpreta como la ubicación del ítem en la escala de desempeño \citep{rodriguez2019}. Estas estimaciones se utilizan luego para ponderar las curvas características de los ítems y construir curvas conjuntas que permiten determinar los puntos de corte en la escala de habilidad.

Este enfoque presenta varias ventajas relevantes. En primer lugar, permite representar explícitamente la incertidumbre del juicio experto mediante intervalos, lo que resulta más consistente con el proceso cognitivo involucrado en la evaluación. En segundo lugar, introduce una representación continua de los niveles de desempeño, facilitando su integración con modelos TRI. En tercer lugar, permite que todos los ítems del banco contribuyan a la determinación de los puntos de corte, superando las limitaciones de los enfoques basados en subconjuntos discretos.

No obstante, la agregación de juicios no equivale a un modelo probabilístico de medición. La estabilidad entre rondas y la proximidad al consenso no permiten por sí solas identificar un desplazamiento compartido por todo el panel. Por ello, el presente trabajo distingue el procedimiento Cloud Delphi original, los dos estimadores de corte que lo utilizan y una extensión jerárquica posterior que modela efectos relativos de juez. Se describen sus fundamentos y su evaluación mediante simulaciones controladas, diferenciando los resultados disponibles de las extensiones aún no evaluadas.

\section{Fundamentos conceptuales}
\subsection{Vaguedad, aleatoriedad y pertenencia}
Los niveles de desempeño son conceptos cualitativos cuyos límites no tienen por qué ser nítidos. En la lógica clásica, la pertenencia de un valor a un conjunto es dicotómica; en la lógica difusa, el grado de compatibilidad se expresa mediante $\mu_A(x)\in[0,1]$. Esta magnitud no debe confundirse con la probabilidad de ocurrencia de un evento. La posibilidad de que un ítem se ubique cerca de una frontera entre niveles justifica solicitar a los jueces intervalos de valoración, en lugar de exigir una precisión puntual que puede ser artificial.

\subsection{Modelo de nube normal}
Una nube normal caracteriza un concepto por la expectativa $Ex$, que expresa su localización central; la entropía $En$, que caracteriza su amplitud; y la hiperentropía $He$, que describe la variabilidad de dicha amplitud \citep{yangz2012,yangy2013}. Para cada gota se genera una entropía particular y una posición condicionada a ella:
\begin{equation}
 En^{*}\sim\mathcal{N}(En,He^2),\qquad X\mid En^{*}=e\sim\mathcal{N}(Ex,e^2).
\end{equation}
Su grado de certeza se representa como
\begin{equation}
 \mu(X)=\exp\!\left[-\frac{(X-Ex)^2}{2(En^{*})^2}\right].
\end{equation}
La construcción reúne vaguedad conceptual y variación aleatoria; no constituye una única función determinista de pertenencia. La hiperentropía del modelo generativo tampoco debe confundirse automáticamente con cualquier indicador operacional de cambio entre rondas.

\section{Método Cloud Delphi ponderado}
\subsection{Elicitación y parámetros individuales}
Sea $i=1,\ldots,I$ el juez, $j=1,\ldots,J$ el ítem y $t=1,\ldots,T$ la ronda. Cada juez proporciona un intervalo $[l_{ijt},u_{ijt}]$ sobre la escala conceptual de desempeño. Sus parámetros se obtienen mediante
\begin{equation}
 Ex_{ijt}=\frac{l_{ijt}+u_{ijt}}{2},\qquad En_{ijt}=\frac{u_{ijt}-l_{ijt}}{6}.
\end{equation}
El factor seis adopta la convención de tres entropías a cada lado de la expectativa: $[l,u]=[Ex-3En,Ex+3En]$. No implica que el intervalo sea un intervalo de confianza probabilístico. En la primera ronda se establece convencionalmente $He^{CDM}_{ij1}=En_{ij1}/6$. A partir de la segunda ronda se registra la expansión externa del intervalo:
\begin{equation}
 He^{CDM}_{ijt}=\frac{\max(u_{ijt}-u_{ij,t-1},0)+\max(l_{ij,t-1}-l_{ijt},0)}{6}.
\end{equation}
Esta magnitud es un índice operacional de expansión entre rondas, no una estimación directa de la varianza latente de la nube normal.

\subsection{Nube sintética y retroalimentación}
La nube sintética no ponderada se construye para cada ítem y ronda con el centro medio del panel y los límites extremos de los intervalos individuales:
\begin{align}
 Ex_{s,jt}&=I^{-1}\sum_i Ex_{ijt},\\
 L_{s,jt}&=\min_i(Ex_{ijt}-3En_{ijt}),\\
 U_{s,jt}&=\max_i(Ex_{ijt}+3En_{ijt}),\\
 En_{s,jt}&=(U_{s,jt}-L_{s,jt})/6,\\
 He_{s,jt}&=I^{-1}\sum_i He^{CDM}_{ijt}.
\end{align}
En cada ronda se devuelve al juez su nube individual y la nube sintética, sin mostrar todavía la nube final ponderada. El especialista puede mantener o modificar su intervalo. El objetivo es facilitar una revisión informada, no imponer la unanimidad.

\subsection{Convergencia, ponderación y nube final}
Desde la segunda ronda se considera el cambio relativo de entropía y la expansión externa relativa:
\begin{equation}
 \Delta En_{ijt}=\frac{|En_{ijt}-En_{ij,t-1}|}{\max(En_{ij,t-1},\epsilon)},\qquad Unc_{ijt}=\frac{He^{CDM}_{ijt}}{\max(En_{ijt},\epsilon)}.
\end{equation}
Se declara convergencia global cuando cada par juez--ítem satisface $\Delta En_{ijt}\leq\delta$ y $Unc_{ijt}\leq u_0$. La presentación emplea $\delta=0.05$ y $u_0=0$ en las simulaciones. Esta regla se refiere a estabilidad de intervalos, no necesariamente a estabilidad de sus centros; conviene verificar también los cambios en $Ex$ como análisis complementario.

Tras la última ronda, se asigna a cada juez un peso normalizado que depende de su proximidad al centro sintético y de sus indicadores de incertidumbre. En forma general,
\begin{equation}
 r_{ij}=\left[\frac{|Ex_{ijT}-Ex_{s,jT}|}{\max(|Ex_{s,jT}|,\epsilon)}+En_{ijT}+He^{CDM}_{ijT}+\epsilon\right]^{-1},\quad w_{ij}=\frac{r_{ij}}{\sum_{i'}r_{i'j}}.
\end{equation}
El uso de una distancia relativa al centro exige regularización cuando el centro está próximo a cero y no es invariante frente a traslaciones de origen. Asimismo, cercanía al consenso no equivale a ausencia de sesgo. Los parámetros agregados son
\begin{align}
 Ex_{wa,j}&=\sum_i w_{ij}Ex_{ijT},\\
 En_{wa,j}&=\sqrt{\sum_i(w_{ij}En_{ijT})^2},\\
 He_{wa,j}&=\sqrt{\sum_i(w_{ij}He^{CDM}_{ijT})^2}.
\end{align}
La posición Cloud final es $\hat{s}_j=Ex_{wa,j}$; $En_{wa,j}$ y $He_{wa,j}$ describen incertidumbre agregada. Las expresiones anteriores describen la regla operacional y no deben interpretarse como estimadores insesgados sin comprobación empírica.

\section{Traducción de las fronteras Cloud a la escala TRI}
\subsection{Curvas características de los ítems}
En el modelo logístico de dos parámetros (2PL), la probabilidad de respuesta correcta es
\begin{equation}
 P_j(\theta)=\frac{1}{1+\exp[-a_j(\theta-b_j)]},\qquad a_j>0.
\end{equation}
Los parámetros $a_j$ y $b_j$ corresponden, respectivamente, a discriminación y dificultad. Los dos estimadores siguientes usan la posición $\hat{s}_j$ y los parámetros calibrados, pero ajustan objetos distintos.

\subsection{Método A: curva característica local-lineal}
Para una frontera conceptual $k$, definimos $u_j=\hat{s}_j-k$ y $K_j=K(u_j/h_k)$, donde $K$ es un núcleo y $h_k$ un ancho de banda. Para cada $\theta$, se ajusta por mínimos cuadrados ponderados la aproximación local $P_j(\theta)\approx\alpha+\beta u_j$. Definiendo
\begin{equation}
 S_r=\sum_jK_ju_j^r,\quad T_r(\theta)=\sum_jK_ju_j^rP_j(\theta),\quad D=S_0S_2-S_1^2,
\end{equation}
se obtiene, cuando $D\ne0$,
\begin{equation}
 \hat\alpha_k(\theta)=\sum_jw^{LL}_{jk}P_j(\theta),\qquad w^{LL}_{jk}=\frac{K_j(S_2-u_jS_1)}{D}.
\end{equation}
Los pesos cumplen $\sum_jw^{LL}_{jk}=1$ y $\sum_jw^{LL}_{jk}(\hat{s}_j-k)=0$. Esta propiedad cancela el término lineal de una expansión local, aunque no elimina el error de estimación de $\hat{s}_j$. Como los pesos local-lineales pueden ser negativos, la curva resultante puede quedar fuera de $[0,1]$; se aplica la truncación $WP_k(\theta)=\min\{1,\max[0,\hat\alpha_k(\theta)]\}$. El corte $\hat\theta_k^A$ satisface $WP_k(\hat\theta_k^A)=0.5$ cuando existe una solución adecuada. La selección del ancho de banda se basa en validación cruzada leave-one-out con divergencia de Kullback--Leibler de Bernoulli integrada. Deben comprobarse soporte local, unicidad del cruce y estabilidad numérica.

\subsection{Método B: regresión local Cloud--TRI}
El segundo estimador aproxima directamente la dificultad calibrada de los ítems en torno a la frontera $k$:
\begin{equation}
 (\hat\alpha_k,\hat\beta_k)=\arg\min_{\alpha,\beta}\sum_jK_j[\hat b_j-\alpha-\beta(\hat{s}_j-k)]^2.
\end{equation}
El corte es el intercepto local, $\hat\theta_k^B=\hat\alpha_k=\sum_jw^{LL}_{jk}\hat b_j$. La pendiente corrige la asimetría de la distribución local, aunque su término se anula al evaluar en la frontera. El ancho de banda se selecciona mediante validación cruzada leave-one-out de las dificultades, con error cuadrático medio como criterio de referencia. Este método no utiliza directamente las discriminaciones de los ítems y su desempeño puede deteriorarse ante error de calibración en $\hat b_j$ o error de medición en $\hat{s}_j$.

\section{Estudio de simulación y resultados disponibles}
\subsection{Diseño}
La presentación del Congreso Internacional de Psicometría (Lima, 2026) describe una arquitectura jerárquica de simulación: escenario, banco independiente, puntos de corte verdaderos y réplicas de panel. El escenario basal E0 incluye 100 ítems, siete jueces, calibración perfecta y cobertura de referencia. Los escenarios E1--E7 modifican, respectivamente, el error de calibración TRI, el desplazamiento sistemático del panel, la heterogeneidad de los jueces, su número, la incertidumbre inicial, el tamaño del banco y la cobertura local alrededor de los cortes. Las dificultades verdaderas del banco 2PL se generan mediante una mezcla de componentes centrales y de colas; las discriminaciones siguen una distribución lognormal positiva. Los indicadores incluyen sesgo, error absoluto medio (MAE), raíz del error cuadrático medio (RMSE), variabilidad entre paneles y soporte local del banco.

\subsection{Resultados comunicados en la presentación}
En E0 ambos métodos generaron cortes válidos en el 100\% de los casos. El RMSE fue 0.0261 para el método B y 0.0879 para el método A; B presentó menor error absoluto en el 89.26\% de las comparaciones pareadas. No obstante, A mostró una desviación estándar entre paneles ligeramente menor. En E1, al incrementar el error de calibración, el RMSE de B alcanzó 0.2300 y el de A 0.1180 en las condiciones más exigentes comunicadas, mostrando que la ventaja basal de B no se conserva necesariamente bajo todas las perturbaciones. En E2, un desplazamiento común del panel de $\pm0.20$ produjo sesgos aproximados de 0.21--0.22 en los cortes y RMSE cercanos a 0.25--0.27. En E3--E4, la heterogeneidad aumentó la dispersión y un mayor número de jueces tendió a mejorar la precisión. En E5, incrementar la incertidumbre inicial elevó el número de rondas sin cambios apreciables en el error final; en E6--E7, la cobertura local del banco resultó determinante. Estos resultados corresponden al material de la presentación y requieren acompañarse de tablas completas, código y especificaciones de réplicas para su comunicación definitiva como resultados reproducibles.

\section{Extensión jerárquica para efectos de juez}
\subsection{Modelo de medición e identificabilidad}
Como extensión posterior al Cloud Delphi original, se propone modelar los centros finales mediante
\begin{equation}
 m_{ij}=s_j+\gamma_i+\varepsilon_{ij},\qquad m_{ij}=Ex_{ijT},
\end{equation}
donde $s_j$ representa la localización ajustada del ítem, $\gamma_i$ el efecto relativo de severidad o indulgencia del juez y $\varepsilon_{ij}$ el residuo. La restricción $\sum_i\gamma_i=0$ identifica las diferencias relativas entre jueces, pero no permite detectar un desplazamiento común a todo el panel. Para ello se necesitarían anclajes externos o restricciones sustantivas adicionales. La incertidumbre de los juicios puede informar pesos de precisión, sin asumir que $En$ y $He$ constituyan por sí mismos varianzas observadas del error.

\subsection{Alternativas de estimación y evaluación pendiente}
Una solución inicial calcula la desviación media del juez respecto del centro del panel para cada ítem y recentra sus valoraciones. Una formulación más general estima conjuntamente $s_j$ y $\gamma_i$ mediante mínimos cuadrados ponderados, máxima verosimilitud bajo supuestos explícitos, estimación MAP con regularización gaussiana o Laplace, o modelos mixtos. Los modelos de Rasch de múltiples facetas aportan antecedentes relevantes para estudiar severidad, aunque no son equivalentes automáticamente al modelo aditivo continuo aquí formulado \citep{thepsathit2024many,uto2020generalized}. La extensión se aplica después de la última ronda y no altera la retroalimentación ni el criterio de convergencia del Cloud Delphi original. Según la presentación, la extensión se encuentra implementada, pero las simulaciones H0--H7 destinadas a evaluar recuperación de efectos, posiciones y cortes todavía están pendientes; por tanto, no se atribuyen mejoras empíricas a este componente.

\section{Discusión y limitaciones}
La combinación de elicitación por intervalos, representación Cloud y calibración TRI ofrece un marco explícito para integrar conocimiento sustantivo e información psicométrica. Las simulaciones comunicadas sugieren un compromiso entre exactitud basal y sensibilidad a errores de calibración: la regresión local Cloud--TRI puede recuperar con mayor precisión los cortes bajo condiciones favorables, mientras que la curva local-lineal puede ser más robusta en determinadas condiciones de calibración perturbada. La estabilidad del consenso no equivale a validez de los puntos de corte; un sesgo común no se elimina por reiterar rondas o aumentar la concordancia. También deben distinguirse la incertidumbre conceptual expresada por los jueces, la variabilidad entre rondas, el error de calibración de ítems y el error de estimación de los cortes.

Para aplicaciones futuras conviene evaluar la sensibilidad a los umbrales de convergencia, la dependencia respecto del origen de la escala en las ponderaciones, los pesos local-lineales negativos, la escasez de soporte cerca de fronteras extremas y la monotonicidad de los cortes estimados. Asimismo, una validación aplicada debería considerar no solo el error en $\theta$, sino sus consecuencias para la clasificación de examinados y la estabilidad de decisiones en poblaciones relevantes. Las propuestas de corrección de severidad requieren evaluación independiente antes de formular conclusiones de eficacia.

% Bibliografía: referencias originales y nuevas entradas documentadas en Referencias.bib
\bibliographystyle{plainnat}
\bibliography{Referencias}
\end{document}
)---"

# Bibliografía íntegra, incluida en este mismo archivo.
referencias <- r"---(@book{beaujean2014,
  author    = {Beaujean, A. A.},
  year      = {2014},
  title     = {Latent Variable Modeling Using R: A Step-by-Step Guide},
  edition   = {1},
  publisher = {Routledge},
  doi       = {10.4324/9781315869780}
}

@book{raykov2011,
  author    = {Raykov, T. and Marcoulides, G. A.},
  year      = {2011},
  title     = {Introduction to Psychometric Theory},
  publisher = {Routledge},
  doi       = {10.4324/9780203841624}
}

@article{garcia2013,
  author  = {Garc{\'i}a, P. E. and Abad, F. J. and Olea, J. and Aguado, D.},
  year    = {2013},
  title   = {A new IRT-based standard setting method: Application to eCat-listening},
  journal = {Psicothema},
  volume  = {25},
  number  = {2},
  pages   = {238--244},
  doi     = {10.7334/psicothema2012.147}
}

@article{pant2009,
  author  = {Pant, H. A. and Rupp, A. A. and Tiffin-Richards, S. P. and K{\"o}ller, O.},
  year    = {2009},
  title   = {Validity issues in standard-setting studies},
  journal = {Studies in Educational Evaluation},
  volume  = {35},
  number  = {2--3},
  pages   = {95--101}
}

@inproceedings{lewis1996,
  author = {Lewis, D. M. and Mitzel, H. C. and Green, D. R.},
  year   = {1996},
  title  = {Standard setting: A bookmark approach}
}

@article{sridharan2025,
  author  = {Sridharan, K. and Sivaramakrishnan, G.},
  year    = {2025},
  title   = {Angoff methods in standard setting in health professional education: A systematic review and meta-analysis},
  journal = {BMC Medical Education},
  volume  = {25},
  pages   = {1727},
  doi     = {10.1186/s12909-025-08300-6}
}

@article{yangy2013,
  author  = {Yang, X. and Yan, L. and Zeng, L.},
  year    = {2013},
  title   = {How to handle uncertainties in AHP: The Cloud Delphi hierarchical analysis},
  journal = {Information Sciences},
  volume  = {222},
  pages   = {384--404},
  doi     = {10.1016/j.ins.2012.08.019}
}

@article{yangz2012,
  author  = {Yang, Y. and Zeng, D. and Zhang, Q.},
  year    = {2012},
  title   = {Cloud model-based approach for uncertainty reasoning in Delphi method},
  journal = {Expert Systems with Applications},
  volume  = {39},
  number  = {9},
  pages   = {7592--7600},
  doi     = {10.1016/j.eswa.2012.01.158}
}

@inproceedings{rodriguez2019,
  author    = {Rodr{\'i}guez, P. and Luzardo, M.},
  year      = {2019},
  title     = {A Modification of the IRT-Based Standard Setting Method},
  booktitle = {The Annual Meeting of the Psychometric Society},
  pages     = {65--73},
  publisher = {Springer International Publishing},
  address   = {Cham}
}

@book{cizek2007,
  author    = {Cizek, G. J. and Bunch, M. B.},
  year      = {2007},
  title     = {Standard Setting: A Guide to Establishing and Evaluating Performance Standards on Tests},
  publisher = {SAGE},
  doi       = {10.4135/9781412985918}
}

@incollection{jaeger1989,
  author    = {Jaeger, R. M.},
  year      = {1989},
  title     = {Certification of Student Competence},
  booktitle = {Educational Measurement},
  edition   = {3},
  editor    = {Linn, R. L.},
  pages     = {485--514},
  publisher = {American Council on Education and Macmillan}
}

@incollection{ferrara2026,
  author    = {Ferrara, S. and Davis-Becker, S. and Kannan, P. and Reynolds, K.},
  year      = {2026},
  title     = {Standard Setting: A Cognitive and Social Model},
  booktitle = {Educational Measurement},
  editor    = {Cook, L. L. and Pitoniak, M. J.},
  edition   = {5},
  pages     = {821--894},
  publisher = {Oxford University Press},
  doi       = {10.1093/oso/9780197654965.003.0012}
}

@article{thepsathit2024many,
  author  = {Thepsathit, P. and Tangdhanakanond, K.},
  title   = {Many-Facet Rasch Measurement Model: Concepts and Necessary Statistic for Performance Assessment},
  journal = {Journal of Education and Innovation},
  volume  = {26},
  number  = {1},
  pages   = {435--448},
  year    = {2024}
}

@article{uto2020generalized,
  author  = {Uto, M. and Ueno, M.},
  title   = {A Generalized Many-Facet Rasch Model and its Bayesian Estimation Using Hamiltonian Monte Carlo},
  journal = {Behaviormetrika},
  volume  = {47},
  number  = {2},
  pages   = {469--496},
  year    = {2020}
}
@article{rodriguez2025,
 author={Rodríguez, P. and Soca, J. and Castillo, M. and Luzardo, M.},
 title={Evaluaciones educativas estandarizadas: desde el marco a los resultados},
 journal={Cuadernos de Investigación Educativa},
 year={2025}, volume={16}, number={2}, doi={10.18861/cied.2025.16.2.4015}
}
)---"

# Generación del PDF desde R; no requiere archivos fuente adicionales.
generar_paper <- function(directorio = getwd()) {
  if (!requireNamespace("tinytex", quietly = TRUE)) {
    stop("Instalá tinytex con install.packages('tinytex').")
  }
  dir.create(directorio, recursive = TRUE, showWarnings = FALSE)
  directorio <- normalizePath(directorio, mustWork = TRUE)
  tex <- file.path(directorio, "Cloud_Delphi.tex")
  bib <- file.path(directorio, "Referencias.bib")
  writeLines(enc2utf8(articulo), tex, useBytes = TRUE)
  writeLines(enc2utf8(referencias), bib, useBytes = TRUE)
  tinytex::latexmk(tex, engine = "pdflatex", bib_engine = "bibtex")
  invisible(file.path(directorio, "Cloud_Delphi.pdf"))
}

# Ejecutar automáticamente al correr el archivo completo.
generar_paper()
