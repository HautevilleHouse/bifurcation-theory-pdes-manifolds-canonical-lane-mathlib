import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure CriticalityConditionPackage {P : BifurcationOperatorPackage} where
  equilibrium : P.manifold
  parameterValue : P.parameterSpace
  eigenvalueCrossing : Prop
  kernelDimensionOne : Prop
  transversalityCondition : Prop
  linearizedSpectrumControlled : Prop

structure CriticalityConditionEvidence {P : BifurcationOperatorPackage}
    (C : CriticalityConditionPackage P) where
  eigenvalueCrossingClosed : C.eigenvalueCrossing
  kernelDimensionOneClosed : C.kernelDimensionOne
  transversalityConditionClosed : C.transversalityCondition
  linearizedSpectrumControlledClosed : C.linearizedSpectrumControlled

def CriticalityConditionClosed {P : BifurcationOperatorPackage}
    (C : CriticalityConditionPackage P) : Prop :=
  C.eigenvalueCrossing ∧ C.kernelDimensionOne ∧
  C.transversalityCondition ∧ C.linearizedSpectrumControlled

theorem criticality_condition_closed_from_evidence {P : BifurcationOperatorPackage}
    (C : CriticalityConditionPackage P) (E : CriticalityConditionEvidence C) :
    CriticalityConditionClosed C := by
  exact And.intro E.eigenvalueCrossingClosed
    (And.intro E.kernelDimensionOneClosed
      (And.intro E.transversalityConditionClosed E.linearizedSpectrumControlledClosed))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse