class ScenePolicy < ScriptPolicy
  def update?
    record.script.user == user
  end
end
