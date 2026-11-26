# Weighted Cloud Delphi — self-contained manuscript
# Save this file in UTF-8. Run using Source in RStudio.
# Requires tinytex and a LaTeX distribution (e.g., TinyTeX).
# Initial installation, if needed:
# install.packages("tinytex")
# tinytex::install_tinytex()

# Self-contained LaTeX manuscript organized according to the requested editorial structure.
articulo <- r"---(\documentclass[11pt,a4paper]{article}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
\usepackage{amsmath,amssymb}
\usepackage[round,authoryear]{natbib}
\usepackage{geometry}
\geometry{margin=2.5cm}
\usepackage{hyperref}
\title{Weighted Cloud Delphi Method}
\author{Authors to be confirmed}
\date{}
\begin{document}
\maketitle
\renewcommand{\abstractname}{Abstract}
\begin{abstract}
This study presents a formulation of the weighted Cloud Delphi method for standard setting by integrating expert judgment and item response theory (IRT). The procedure represents judgment intervals through expectation, entropy, and hyperentropy, and maps conceptual boundaries onto the ability scale using two local estimators. Simulation scenarios E0--E7 and a hierarchical extension whose evaluation remains pending are described.
\end{abstract}


Standard setting is a central problem in educational measurement because it determines the interpretation of scores and supports consequential decisions in large-scale assessment. In particular, cut scores allow examinees to be classified into qualitatively distinct performance levels, which is essential for diagnosis, certification, and educational policy development \\citep{ferrara2026,pant2009,rodriguez2025}. Despite methodological advances over recent decades \\citep{cizek2007}, this process remains debated, largely because of the sensitivity of results to the methods employed and the variability inherent in expert judgment \\citep{jaeger1989,cizek2007}.

Traditional standard-setting methods have relied heavily on expert judgment, as exemplified by the Angoff and Bookmark approaches \\citep{lewis1996,sridharan2025}. However, these methods have recognized limitations, including the substantial cognitive burden placed on judges and the absence of formal mechanisms for modeling uncertainty and variability in their judgments. In response, approaches integrating psychometric models, particularly item response theory (IRT), with expert judgment have been developed to draw simultaneously on empirical item-bank information and specialists' substantive knowledge.

More broadly, this integration falls within the framework of latent variable modeling in psychometrics, which seeks to formally represent the relationship between empirical observations and unobserved constructs. Contemporary psychometric developments have emphasized the need for explicit models that enable the evaluation of validity, reliability, and sources of measurement error \\citep{beaujean2014,raykov2011}. These authors emphasize that psychometric models are fundamental tools for linking substantive theory to observed data and rigorously examining sources of variability in measurement processes.

In this context, the method proposed by García and colleagues (2013) represents a significant advance by formally connecting the ability scale and performance levels through item characteristic curves. Cut scores are determined from combined characteristic curves representing the expected behavior of items associated with each level. However, this method assumes that items assigned to a given level represent that level homogeneously, which may be problematic in heterogeneous item banks.

To address this limitation, subsequent work has proposed weighting mechanisms reflecting the differential contribution of items alongside more flexible expert judgment elicitation procedures. Cloud Delphi \\citep{yangz2012} has been introduced as a tool for modeling uncertainty in judges' assessments. This approach combines elements of probability theory and fuzzy logic through the cloud model, in which a qualitative concept is represented by three parameters: expectation, entropy, and hyperentropy. Expectation captures the central value of the concept, entropy reflects its dispersion or uncertainty, and hyperentropy models variability in that uncertainty.

Cloud Delphi allows judges to express judgments as intervals on a continuous performance scale rather than point estimates \\citep{yangy2013}. The midpoint represents the central judgment, whereas the width reflects the judge's uncertainty. Individual clouds are constructed from these intervals and subsequently aggregated into a synthetic cloud and a weighted cloud, whose expectation is interpreted as the item's location on the performance scale \\citep{rodriguez2019}. These estimates are then used to weight item characteristic curves and construct combined curves for determining cut scores on the ability scale.

This approach offers several advantages. First, intervals explicitly represent uncertainty in expert judgment, which is more consistent with the cognitive process involved in assessment. Second, a continuous representation of performance levels facilitates integration with IRT models. Third, all items in the bank can contribute to cut-score determination, overcoming limitations of approaches based on discrete subsets.

Nevertheless, aggregating judgments is not equivalent to a probabilistic measurement model. Stability across rounds and proximity to consensus cannot alone identify a shift shared by the entire panel. Accordingly, this study distinguishes the original Cloud Delphi procedure, the two cut-score estimators that use it, and a subsequent hierarchical extension modeling relative judge effects. Their foundations and evaluation through controlled simulations are described, distinguishing available results from extensions not yet evaluated.

\section{Previous Literature: Conceptual Foundations and Background}
\subsection{Psychometric Foundations of Standard Setting}
The integration of IRT and expert judgment connects conceptually defined performance levels to an ability scale. The method of García and colleagues \\citep{garcia2013} provides a precedent for this integration through combined characteristic curves. Incorporating Cloud Delphi allows uncertainty in judgments to be represented and differential item contributions to be considered \\citep{rodriguez2019,yangz2012}.
\subsection{Vagueness, Randomness, and Membership}
Performance levels are qualitative concepts whose boundaries need not be sharp. In classical logic, membership in a set is dichotomous; in fuzzy logic, the degree of compatibility is expressed as $\\mu_A(x)\\in[0,1]$. This quantity should not be confused with the probability of an event. The possibility that an item lies near a boundary between levels justifies eliciting judgment intervals rather than requiring potentially artificial point precision.

\subsection{Normal Cloud Model}
A normal cloud characterizes a concept through expectation $Ex$, its central location; entropy $En$, its width; and hyperentropy $He$, the variability of that width \\citep{yangz2012,yangy2013}. For each cloud droplet, a particular entropy and a position conditional on it are generated:
\begin{equation}
 En^{*}\sim\mathcal{N}(En,He^2),\qquad X\mid En^{*}=e\sim\mathcal{N}(Ex,e^2).
\end{equation}
Its degree of certainty is represented as
\begin{equation}
 \mu(X)=\exp\!\left[-\frac{(X-Ex)^2}{2(En^{*})^2}\right].
\end{equation}
This construction combines conceptual vagueness and random variation; it is not a single deterministic membership function. Hyperentropy in the generative model should not automatically be equated with any operational indicator of change across rounds.

\section{Purpose of Study}
The purpose of this study is to formalize the weighted Cloud Delphi method for establishing cut scores on the IRT ability scale and to examine, through simulations, the performance of two local estimators linking conceptual item locations to psychometric parameters. A complementary hierarchical extension is proposed to represent relative judge effects, whose empirical evaluation remains pending.
\subsection{Research Questions}
\begin{enumerate}
\\item How can uncertainty in interval judgments and psychometric item information be integrated into cut-score estimation?
\\item How do methods A and B compare in bias, precision, and stability under simulation conditions E0--E7?
\\item How do calibration error, panel characteristics, and item-bank coverage affect cut-score recovery?
\\item Which relative judge effects can be identified through a hierarchical extension, and what identification constraints are required? This methodological question remains to be evaluated through simulation.
\end{enumerate}

\section{Methods}
\subsection{Weighted Cloud Delphi Method}
\subsubsection{Elicitation and Individual Parameters}
Let $i=1,\\ldots,I$ denote the judge, $j=1,\\ldots,J$ the item, and $t=1,\\ldots,T$ the round. Each judge provides an interval $[l_{ijt},u_{ijt}]$ on the conceptual performance scale. Its parameters are obtained as follows:
\begin{equation}
 Ex_{ijt}=\frac{l_{ijt}+u_{ijt}}{2},\qquad En_{ijt}=\frac{u_{ijt}-l_{ijt}}{6}.
\end{equation}
The factor of six adopts the convention of three entropies on either side of the expectation: $[l,u]=[Ex-3En,Ex+3En]$. It does not imply that the interval is a probabilistic confidence interval. In the first round, $He^{CDM}_{ij1}=En_{ij1}/6$ is set by convention. From the second round onward, outward expansion of the interval is recorded:
\begin{equation}
 He^{CDM}_{ijt}=\frac{\max(u_{ijt}-u_{ij,t-1},0)+\max(l_{ij,t-1}-l_{ijt},0)}{6}.
\end{equation}
This quantity is an operational index of expansion across rounds, not a direct estimate of the latent variance of the normal cloud.

\subsubsection{Synthetic Cloud and Feedback}
The unweighted synthetic cloud is constructed for each item and round using the mean panel center and the extreme bounds of individual intervals:
\begin{align}
 Ex_{s,jt}&=I^{-1}\sum_i Ex_{ijt},\\
 L_{s,jt}&=\min_i(Ex_{ijt}-3En_{ijt}),\\
 U_{s,jt}&=\max_i(Ex_{ijt}+3En_{ijt}),\\
 En_{s,jt}&=(U_{s,jt}-L_{s,jt})/6,\\
 He_{s,jt}&=I^{-1}\sum_i He^{CDM}_{ijt}.
\end{align}
In each round, judges receive feedback on their individual cloud and the synthetic cloud, without yet seeing the final weighted cloud. Specialists may retain or modify their intervals. The aim is to facilitate informed revision, not to impose unanimity.

\subsubsection{Convergence, Weighting, and Final Cloud}
From the second round onward, the relative change in entropy and relative outward expansion are considered:
\begin{equation}
 \Delta En_{ijt}=\frac{|En_{ijt}-En_{ij,t-1}|}{\max(En_{ij,t-1},\epsilon)},\qquad Unc_{ijt}=\frac{He^{CDM}_{ijt}}{\max(En_{ijt},\epsilon)}.
\end{equation}
Global convergence is declared when every judge--item pair satisfies $\\Delta En_{ijt}\\leq\\delta$ and $Unc_{ijt}\\leq u_0$. The presentation uses $\\delta=0.05$ and $u_0=0$ in the simulations. This rule concerns interval stability, not necessarily stability of their centers; changes in $Ex$ should also be examined as a complementary analysis.

After the final round, each judge receives a normalized weight depending on proximity to the synthetic center and uncertainty indicators. In general,
\begin{equation}
 r_{ij}=\left[\frac{|Ex_{ijT}-Ex_{s,jT}|}{\max(|Ex_{s,jT}|,\epsilon)}+En_{ijT}+He^{CDM}_{ijT}+\epsilon\right]^{-1},\quad w_{ij}=\frac{r_{ij}}{\sum_{i'}r_{i'j}}.
\end{equation}
Using relative distance to the center requires regularization when the center is near zero and is not invariant to shifts in the scale origin. Furthermore, proximity to consensus does not imply absence of bias. The aggregated parameters are
\begin{align}
 Ex_{wa,j}&=\sum_i w_{ij}Ex_{ijT},\\
 En_{wa,j}&=\sqrt{\sum_i(w_{ij}En_{ijT})^2},\\
 He_{wa,j}&=\sqrt{\sum_i(w_{ij}He^{CDM}_{ijT})^2}.
\end{align}
The final Cloud location is $\\hat{s}_j=Ex_{wa,j}$; $En_{wa,j}$ and $He_{wa,j}$ describe aggregated uncertainty. These expressions describe the operational rule and should not be interpreted as unbiased estimators without empirical verification.

\subsection{Mapping Cloud Boundaries onto the IRT Scale}
\subsubsection{Item Characteristic Curves}
In the two-parameter logistic (2PL) model, the probability of a correct response is
\begin{equation}
 P_j(\theta)=\frac{1}{1+\exp[-a_j(\theta-b_j)]},\qquad a_j>0.
\end{equation}
Parameters $a_j$ and $b_j$ denote discrimination and difficulty, respectively. The following two estimators use location $\\hat{s}_j$ and calibrated parameters but fit different quantities.

\subsubsection{Method A: Local-Linear Characteristic Curve}
For a conceptual boundary $k$, define $u_j=\\hat{s}_j-k$ and $K_j=K(u_j/h_k)$, where $K$ is a kernel and $h_k$ a bandwidth. For each $\\theta$, the local approximation $P_j(\\theta)\\approx\\alpha+\\beta u_j$ is fitted by weighted least squares. Defining
\begin{equation}
 S_r=\sum_jK_ju_j^r,\quad T_r(\theta)=\sum_jK_ju_j^rP_j(\theta),\quad D=S_0S_2-S_1^2,
\end{equation}
we obtain, when $D\\ne0$,
\begin{equation}
 \hat\alpha_k(\theta)=\sum_jw^{LL}_{jk}P_j(\theta),\qquad w^{LL}_{jk}=\frac{K_j(S_2-u_jS_1)}{D}.
\end{equation}
The weights satisfy $\\sum_jw^{LL}_{jk}=1$ and $\\sum_jw^{LL}_{jk}(\\hat{s}_j-k)=0$. This property cancels the linear term of a local expansion, although it does not eliminate estimation error in $\\hat{s}_j$. Because local-linear weights may be negative, the resulting curve may fall outside $[0,1]$; truncation is applied as $WP_k(\\theta)=\\min\\{1,\\max[0,\\hat\\alpha_k(\\theta)]\\}$. The cut score $\\hat\\theta_k^A$ satisfies $WP_k(\\hat\\theta_k^A)=0.5$ when an appropriate solution exists. Bandwidth selection is based on leave-one-out cross-validation with integrated Bernoulli Kullback--Leibler divergence. Local support, uniqueness of the crossing, and numerical stability must be checked.

\subsubsection{Method B: Local Cloud--IRT Regression}
The second estimator directly approximates calibrated item difficulty around boundary $k$:
\begin{equation}
 (\hat\alpha_k,\hat\beta_k)=\arg\min_{\alpha,\beta}\sum_jK_j[\hat b_j-\alpha-\beta(\hat{s}_j-k)]^2.
\end{equation}
The cut score is the local intercept, $\\hat\\theta_k^B=\\hat\\alpha_k=\\sum_jw^{LL}_{jk}\\hat b_j$. The slope corrects for asymmetry in the local distribution, although its term vanishes when evaluated at the boundary. Bandwidth is selected through leave-one-out cross-validation of difficulties, using mean squared error as the reference criterion. This method does not directly use item discriminations, and its performance may deteriorate under calibration error in $\\hat b_j$ or measurement error in $\\hat{s}_j$.

\subsection{Simulation Study Design}
The presentation at the International Congress of Psychometrics (Lima, 2026) describes a hierarchical simulation architecture: scenario, independent item bank, true cut scores, and panel replicates. Baseline scenario E0 includes 100 items, seven judges, perfect calibration, and reference coverage. Scenarios E1--E7 respectively vary IRT calibration error, systematic panel shift, judge heterogeneity, number of judges, initial uncertainty, bank size, and local coverage around cut scores. True difficulties in the 2PL bank are generated from a mixture of central and tail components; discriminations follow a positive lognormal distribution. Indicators include bias, mean absolute error (MAE), root mean squared error (RMSE), between-panel variability, and local item-bank support.

\subsection{Hierarchical Extension for Judge Effects}
\subsubsection{Measurement Model and Identifiability}
As a subsequent extension to the original Cloud Delphi procedure, final centers are modeled as
\begin{equation}
 m_{ij}=s_j+\gamma_i+\varepsilon_{ij},\qquad m_{ij}=Ex_{ijT},
\end{equation}
where $s_j$ represents adjusted item location, $\\gamma_i$ the relative severity or leniency effect of the judge, and $\\varepsilon_{ij}$ the residual. The constraint $\\sum_i\\gamma_i=0$ identifies relative differences among judges but cannot detect a shift common to the entire panel. External anchors or additional substantive constraints would be required. Judgment uncertainty can inform precision weights without assuming that $En$ and $He$ are themselves observed error variances.

\subsubsection{Estimation Alternatives and Pending Evaluation}
An initial solution calculates each judge's mean deviation from the panel center for each item and recenters the judgments. A more general formulation jointly estimates $s_j$ and $\\gamma_i$ using weighted least squares, maximum likelihood under explicit assumptions, MAP estimation with Gaussian or Laplace regularization, or mixed models. Many-facet Rasch models provide relevant precedents for studying severity, although they are not automatically equivalent to the continuous additive model formulated here \\citep{thepsathit2024many,uto2020generalized}. The extension is applied after the final round and does not alter feedback or the original Cloud Delphi convergence criterion. According to the presentation, the extension has been implemented, but simulations H0--H7 intended to evaluate recovery of effects, locations, and cut scores remain pending; therefore, no empirical improvements are attributed to this component.

\section{Results}
\subsection{Results Reported in the Presentation}
In E0, both methods generated valid cut scores in 100\\% of cases. RMSE was 0.0261 for method B and 0.0879 for method A; B yielded lower absolute error in 89.26\\% of paired comparisons. However, A showed a slightly smaller between-panel standard deviation. In E1, as calibration error increased, RMSE reached 0.2300 for B and 0.1180 for A under the most demanding reported conditions, indicating that B's baseline advantage does not necessarily persist under all perturbations. In E2, a common panel shift of $\\pm0.20$ produced cut-score biases of approximately 0.21--0.22 and RMSE values near 0.25--0.27. In E3--E4, heterogeneity increased dispersion and a larger number of judges tended to improve precision. In E5, increasing initial uncertainty increased the number of rounds without appreciable changes in final error; in E6--E7, local item-bank coverage was decisive. These results come from the presentation and require complete tables, code, and replication specifications before definitive reporting as reproducible results.

\section{Discussion}
Combining interval elicitation, Cloud representation, and IRT calibration provides an explicit framework for integrating substantive knowledge and psychometric information. The reported simulations suggest a trade-off between baseline accuracy and sensitivity to calibration error: local Cloud--IRT regression may recover cut scores more accurately under favorable conditions, whereas the local-linear curve may be more robust under certain perturbed calibration conditions. Consensus stability is not equivalent to cut-score validity; common bias is not eliminated by repeating rounds or increasing agreement. Conceptual uncertainty expressed by judges, between-round variability, item calibration error, and cut-score estimation error must also be distinguished.

\section{Limitations and future research}
The available evidence comes from results reported in the presentation and this manuscript does not include executable simulation code, complete tables, or all replication specifications. Reproducibility and evaluation of the hierarchical extension therefore require additional work. The absence of external anchors limits identification of common panel bias.

Future applications should assess sensitivity to convergence thresholds, dependence of weights on the scale origin, negative local-linear weights, sparse support near extreme boundaries, and monotonicity of estimated cut scores. Applied validation should consider not only error in $\\theta$ but also its consequences for examinee classification and decision stability in relevant populations. Severity correction proposals require independent evaluation before conclusions about effectiveness can be drawn.

\section*{Conflicts of Interest Statement}
Statement pending confirmation by all authors before editorial submission.

\renewcommand{\refname}{References}
% Bibliography: original references and new entries documented in Referencias.bib
\bibliographystyle{plainnat}
\bibliography{Referencias}
\end{document}
)---"

# Complete bibliography embedded in this file.
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

# Generate PDF from R; no additional source files required.
generar_paper <- function(directorio = getwd()) {
  if (!requireNamespace("tinytex", quietly = TRUE)) {
    stop("Install tinytex using install.packages('tinytex').")
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

# Run automatically when sourcing the complete file.
generar_paper()
