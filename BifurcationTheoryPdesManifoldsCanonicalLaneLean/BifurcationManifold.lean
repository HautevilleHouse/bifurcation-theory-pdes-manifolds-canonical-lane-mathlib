import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BifurcationTheoryPdesManifoldsCanonicalLaneLean

structure BifurcationManifoldPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Prop
  dimension : Nat
  parameterDependentMetric : Prop
  parameterDependenceSmooth : Prop

structure BifurcationManifoldEvidence (M : BifurcationManifoldPackage) where
  smoothStructureClosed : M.smoothStructure
  dimensionClosed : M.dimension = 3
  parameterDependentMetricClosed : M.parameterDependentMetric
  parameterDependenceSmoothClosed : M.parameterDependenceSmooth

def BifurcationManifoldClosed (M : BifurcationManifoldPackage) : Prop :=
  M.smoothStructure ∧ M.dimension = 3 ∧ M.parameterDependentMetric ∧ M.parameterDependenceSmooth

theorem bifurcation_manifold_closed_from_evidence (M : BifurcationManifoldPackage)
    (E : BifurcationManifoldEvidence M) : BifurcationManifoldClosed M := by
  exact And.intro E.smoothStructureClosed
    (And.intro E.dimensionClosed
      (And.intro E.parameterDependentMetricClosed E.parameterDependenceSmoothClosed))

end BifurcationTheoryPdesManifoldsCanonicalLaneLean
end HautevilleHouse
