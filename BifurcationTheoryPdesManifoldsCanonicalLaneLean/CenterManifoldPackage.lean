import BifurcationTheoryPdesManifoldsCanonicalLaneLean.LinearizationPackage

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure CenterManifoldPackage {A : AdmissibleClass} {L : LinearizationPackage A} where
  centerManifoldDimension : ℕ
  centerManifoldExists : Prop
  spectralGapCondition : Prop
  reductionOrderOne : Prop

structure CenterManifoldEvidence {A : AdmissibleClass} {L : LinearizationPackage A} (C : CenterManifoldPackage L) where
  centerManifoldExistsClosed : C.centerManifoldExists
  spectralGapConditionClosed : C.spectralGapCondition
  reductionOrderOneClosed : C.reductionOrderOne

def CenterManifoldClosed {A : AdmissibleClass} {L : LinearizationPackage A} (C : CenterManifoldPackage L) : Prop :=
  C.centerManifoldExists ∧ C.spectralGapCondition ∧ C.reductionOrderOne

theorem center_manifold_closed_from_evidence {A : AdmissibleClass} {L : LinearizationPackage A} (C : CenterManifoldPackage L) (E : CenterManifoldEvidence C) : CenterManifoldClosed C := by
  exact And.intro E.centerManifoldExistsClosed (And.intro E.spectralGapConditionClosed E.reductionOrderOneClosed)

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse