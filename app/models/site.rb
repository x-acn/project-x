class Site
  if Locomotive.config.multi_sites? || Locomotive.config.manage_domains?
    field :main
    def main?
      self.main
    end
  end
end
