import BifurcationTheoryPdesManifoldsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure CenterManifoldReduction (A : AdmissibleClass) where
  centerDimension : ℕ
  reducedEquation : (ℝ → ℝ ^ centerDimension) → ℝ ^ centerDimension
  reductionValid : Prop
  normalFormComputed : Prop
  reductionValidTerm : reductionValid
  normalFormComputedTerm : normalFormComputed

structure BifurcationAnalysisPackage (A : AdmissibleClass) where
  centerManifold : CenterManifoldReduction A
  bifurcationEquationLinearized : Prop
  eigenvalueCrossingCondition : Prop
  bifurcationDiagramComputed : Prop
  analysisComplete : Prop

structure BifurcationAnalysisEvidence (A : AdmissibleClass)
    (P : BifurcationAnalysisPackage A) where
  centerManifoldClosed : P.centerManifold.reductionValid ∧ P.centerManifold.normalFormComputed
  bifurcationEquationLinearizedClosed : P.bifurcationEquationLinearized
  eigenvalueCrossingConditionClosed : P.eigenvalueCrossingCondition
  bifurcationDiagramComputedClosed : P.bifurcationDiagramComputed
  analysisCompleteClosed : P.analysisComplete

def BifurcationAnalysisClosed (A : AdmissibleClass)
    (P : BifurcationAnalysisPackage A) : Prop :=
  (P.centerManifold.reductionValid ∧ P.centerManifold.normalFormComputed) ∧
  P.bifurcationEquationLinearized ∧
  P.eigenvalueCrossingCondition ∧
  P.bifurcationDiagramComputed ∧
  P.analysisComplete

theorem bifurcation_analysis_closed_from_evidence (A : AdmissibleClass)
    (P : BifurcationAnalysisPackage A) (E : BifurcationAnalysisEvidence A P) :
    BifurcationAnalysisClosed A P := by
  exact And.intro E.centerManifoldClosed
    (And.intro E.bifurcationEquationLinearizedClosed
      (And.intro E.eigenvalueCrossingConditionClosed
        (And.intro E.bifurcationDiagramComputedClosed E.analysisCompleteClosed)))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse