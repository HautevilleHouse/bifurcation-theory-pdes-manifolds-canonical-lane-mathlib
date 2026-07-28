import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure CenterManifoldPackage {P : BifurcationOperatorPackage}
    {C : CriticalityConditionPackage P} where
  centerManifoldExists : Prop
  reductionDimension : ℕ
  reducedDynamicsWellDefined : Prop
  persistenceUnderParameterChange : Prop
  localBifurcationDiagram : Prop

structure CenterManifoldEvidence {P : BifurcationOperatorPackage}
    {C : CriticalityConditionPackage P} (M : CenterManifoldPackage P C) where
  centerManifoldExistsClosed : M.centerManifoldExists
  reducedDynamicsWellDefinedClosed : M.reducedDynamicsWellDefined
  persistenceUnderParameterChangeClosed : M.persistenceUnderParameterChange
  localBifurcationDiagramClosed : M.localBifurcationDiagram

def CenterManifoldClosed {P : BifurcationOperatorPackage}
    {C : CriticalityConditionPackage P} (M : CenterManifoldPackage P C) : Prop :=
  M.centerManifoldExists ∧ M.reducedDynamicsWellDefined ∧
  M.persistenceUnderParameterChange ∧ M.localBifurcationDiagram

theorem center_manifold_closed_from_evidence {P : BifurcationOperatorPackage}
    {C : CriticalityConditionPackage P} (M : CenterManifoldPackage P C)
    (E : CenterManifoldEvidence M) : CenterManifoldClosed M := by
  exact And.intro E.centerManifoldExistsClosed
    (And.intro E.reducedDynamicsWellDefinedClosed
      (And.intro E.persistenceUnderParameterChangeClosed E.localBifurcationDiagramClosed))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse